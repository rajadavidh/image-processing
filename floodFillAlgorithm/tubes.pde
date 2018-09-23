import controlP5.*;
import javax.swing.*; 


PImage gambar;
ControlWindow controlwindow;
ControlP5 controlP5;
float Tolerance=10;
int x = 200;
int y = 200;
int tes=0;
color warna;
int pil=1;
color warnahapus=color(255,255,0);
Stack s = new Stack();
pixel hasil = new pixel();
//membuat tipe data baru
class pixel{
  int x;
  int y;
  boolean cek=false;
  
  public pixel(){
  }
  public pixel(int x, int y){
    this.x=x;
    this.y=y;
  }
}

pixel p = new pixel();
pixel q = new pixel();

void setup() {
  //browse gambar
  browse();
  //img2=createImage(gambar.width,gambar.height,RGB);
  // tint(255,0);
  //image(img2,0,0);
  if (gambar != null) 
      size(gambar.width,gambar.height); 
  //else
 // smooth();
  
  //menu controller
  controlP5=new ControlP5(this);
  controlwindow=controlP5.addControlWindow("Control",100,100,400,200);
  Controller b1=controlP5.addButton("browse",1,100,10,60,20);
  Controller b2=controlP5.addButton("Remove",2,100,35,60,20);
  Controller b3=controlP5.addButton("help",3,100,80,60,20);
  Controller b4=controlP5.addButton("AboutUs",4,100,105,60,20);
  Controller b5=controlP5.addButton("Simpan",4,210,80,60,20);
  Controller s1=controlP5.addSlider("Tolerance",0,100,30,210,120,100,20);
  Controller b6=controlP5.addButton("Keluar",4,300,80,60,20);
  s1.setWindow(controlwindow);
  b1.setWindow(controlwindow);
  b2.setWindow(controlwindow);
  b3.setWindow(controlwindow);
  b4.setWindow(controlwindow);
  b5.setWindow(controlwindow);
  b6.setWindow(controlwindow);
  Controller t1 = controlP5.addToggle("global_or_contigous",false, 100,135,20,20);
  t1.setWindow(controlwindow);
}

void draw(){
 //size(gambar.width,gambar.height); 
 
 //mouse
 if (mousePressed) {
   warna=get(mouseX,mouseY); 
   p.x= mouseX;
   p.y=mouseY;
 
   if (pil==1) {
     System.out.println("global");
     global();
   } else {
     System.out.println("continous");
     continous();
     //p.cek=true;
   }
   PImage img2=createImage(gambar.width,gambar.height,RGB);
   tint(255,0);
   image(img2,0,0);
   /*
   if (k>0) {
     tint(255,0);
     image(img2,0,0);
   }else{
     tint(255,0);
     image(img2,0,0);
   }
    k++;
    */
 }
}
   
 
 

//prosedur browse gambar
void browse () {
    // create a file chooser 
    final JFileChooser fc = new JFileChooser(); 
 
    // in response to a button click: 
    int returnVal = fc.showOpenDialog(this); 
 
    if (returnVal == JFileChooser.APPROVE_OPTION) { 
        File file = fc.getSelectedFile(); 
        // see if it's an image 
        // (better to write a function and check for all supported extensions) 
        //pilih gambar jpg atau png
        if ((file.getName().endsWith("jpg")) || (file.getName().endsWith("png"))) { 
            // load the image using the given file path
            gambar = loadImage(file.getPath()); 
            //if (gambar != null) { 
            // size the window and show the image 
            size(gambar.width,gambar.height); 
            //rect(0,0,gambar.width+40,gambar.height+40);
            //background(sliderbackground);
            image(gambar,0,0); 
              
        }else{ 
            // just print the contents to the console 
            // note: loadStrings can take a Java File Object too 
            String lines[] = loadStrings(file); 
            for (int i = 0; i < lines.length; i++) { 
                println(lines[i]);  
            } 
        } 
    }else{ 
        println("Open command cancelled by user."); 
    }
}


//prosedur seleksi global
void global() {
 float persen = ((Tolerance/100)*16777216)/6;
 for (int i=0; i<=gambar.width;i++) {
  for (int j=0; j<=gambar.height;j++) {
    if (get(i,j) >= warna-persen && get(i,j) <= warna+persen) {
           //System.out.println(warna);
           p.x=i;
           p.y=j;
           //pt (p.x,p.y);
           //System.out.print(p.x+ " ");
           //System.out.print(p.y+ " ");
           s.push(p);
           q=(pixel)s.pop();
           stroke (255,255,0);
           point (q.x,q.y);
           
    }
           //System.out.print("tes");
           //q=(pixel)s.pop();   
           //System.out.print(q.x);     
    }
  }
 }
 
//prosedur seleksi contious 
void continous(){
  float persen=((Tolerance/100) * 16777216)/6;
  /*int curpixel=get(x,y);
  if(curpixel >= warna-9000 && curpixel<=warna+9000 && x <= batasx && y <= batasy){
     stroke (255,255,0);
     pt (q.x,q.y);
    continous(x+1,y,batasx,batasy);
    continous(x,y+1,batasx,batasy);
    continous(x-1,y,batasx,batasy);
    continous(x,y-1,batasx,batasy);*/
    
    //melakukan floodfill stack
    s.push(p);
    while(s.empty()==false){
      if(get(p.x+1,p.y)>= warna-persen && get(p.x+1,p.y)<=warna+persen && get(p.x+1,p.y) != -256 && p.x < gambar.width){
        p.x=p.x+1;
        p.cek=true;
        s.push(p);
         stroke (255,255,0);
         point (p.x,p.y);
         //System.out.println(q);
      }else if(get(p.x,p.y+1)>= warna-persen && get(p.x,p.y+1)<=warna+persen && get(p.x,p.y+1) != -256 && p.y < gambar.height){
        p.y=p.y+1;
        p.cek=true;
        s.push(p);
        //System.out.println(p);
        stroke (255,255,0);
        point (p.x,p.y);
        //System.out.println(q);
      }else if(get(p.x-1,p.y)>= warna-persen && get(p.x-1,p.y)<=warna+persen && get(p.x-1,p.y) != -256 && p.x > 0){
        p.x=p.x-1;
        p.cek=true;
        s.push(p);
        //System.out.println(p);
        stroke (255,255,0);
        point (p.x,p.y);
     
      }else if(get(p.x,p.y-1)>= warna-persen && get(p.x,p.y-1)<=warna+persen && get(p.x,p.y-1) != -256 && p.y >0){
        p.y=p.y-1;
        p.cek=true;
        s.push(p);
        //System.out.println(p);
        stroke (255,255,0);
        point (p.x,p.y);
        //System.out.println(q);
      }else
      p=(pixel)s.pop(); 
    }
}


//prosedur menghapus warna
void Remove(){
 //System.out.println(warnahapus);
 for (int i=0; i<=gambar.width;i++) {
  for (int j=0; j<=gambar.height;j++) {
    if (get(i,j) == -256 ) {
          // System.out.println(warna);
           p.x=i;
           p.y=j;
           //pt (p.x,p.y);
           //System.out.print(p.x+ " ");
           //System.out.print(p.y+ " ");
           s.push(p);
           q=(pixel)s.pop();
           stroke (255,255,255);
           point (q.x,q.y);
    }
  }
 }
}

//toggle pemilihan apakah seleksi global atau continous
void global_or_contigous(ControlEvent event) {
   if(event.isController()) {
    if (event.controller().value()==0)
       pil=1;
    else
       pil=2; 
  }
 }
 
//prosedur bantuan 
void help() {
  System.out.println("1.Pada pertama kali run,maka anda kan langsung masuk fitur load image");
  System.out.println("2.Kemudian tekan togle,jika togle aktif maka anda memilih mmode continous");
  System.out.println("jika togle mati maka anda memilih mode global");
  System.out.println("3.Atur tolerancy melalui slider");
}

//prosedur About us
void AboutUs() {
   System.out.println("Bayu Santiko Adi 113091029");
   System.out.println("Alfa Pahlawan Putra 113091032");
   System.out.println("Raja David Hasugian 113091045");
   System.out.println("Ano Rangga Rahardika 113091049");
}


//saving image
void Simpan(){
   saveFrame("gambar_edit/simpanan.jpg");
}

void Keluar(){
   exit(); 
}

