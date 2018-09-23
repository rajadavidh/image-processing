// STANDAR TEMPLATE TUBES GRAFCIT @IT TELKOM | 2011
//--------------------------------- inisialisasi, ga perlu dirubah
static int canvasW = 600;
static int canvasH = 600;
void setup() {
  size(canvasW, canvasH);
  background(255);
}

//--------------------------------- variable global ditulis disini
float s=0.5;
int x0 = 30;
int y0 = 30;
int rx = 200;
int ry = 100;
int tebal =3;
int tx = 0;
int ty = -200;
boolean nocolor=false;
color warna = color (150,150,150);
color filling = color(0,255,0);
int modeStyle=2;// jika mode =1 maka garis tidak putus putus
                 // jika mode = 2 maka mode morse aktif
                 // jika mode >= 3 garis putus putus menyesuaikan angka


//--------------------------------- disini mulai codingnya
void draw() {
  drawHelpLines();
  elips(x0,y0,rx,ry,tebal,modeStyle,warna,filling,nocolor);
  translasi(x0,y0,rx,ry,tebal,modeStyle,warna,filling,nocolor,tx,ty);
  scaling(x0,y0,rx,ry,tebal,modeStyle,warna,filling,nocolor,s);
} 




//--------------------------------- procedure/fungsi bikinan sendiri
/* 
void buatelips(int x0, int y0, int rx, int ry, int tebal,int style,color warna, color filling,boolean nocolor) 
  membuat elips, memiliki 9 parameter;
  -x0 dan y0 merupakan titik pusat elips
  -rx adalah jari-jari x dari elips
  -ry adalah jari-jari y dari elips 
  -tebal adalah tebal dari outline elips
  -modeStyle adalah pilihan untuk mode outline garis, yaitu:
      1: garis biasa
      2: garis morse
      >3: putus putus dengan jarak putus sesuai dengan besar angka
  -warna : untuk memilih warna dari outline elips
  -filling: warna untuk filling dari elips
  -nocolor pilihan untuk filling elips
     true : elips tidak mempunyai warna;
     false:
*/ 
void buatelips(int x0, int y0,int rx,int ry,int tebal,int style, color warna, boolean nocolor){
  int mode=1;
  
  //................ kasus rx > ry
  //.................region 1
  if (rx > ry) {
    int x1 = 0;
    int y1 = ry;  
    stdPoint(x0, ry+y0);
    stdPoint(x0,-ry+y0);
    stdPoint(rx+x0, y0);
    stdPoint(-rx+x0, y0);
    float P0 = (ry*ry) - (rx*rx*ry + (1/4)*rx*rx);
    int Px = 0;
    int Py = 2*rx*rx*y1;
    while (Px<Py) {
    
      if (style == 1)  mode=1;
      x1 = x1 + 1;
      Px = Px + (2*ry*ry);
      if (P0 >= 0) {
        y1 -= 1;
        Py = Py - (2*rx*rx);
        P0 = P0 + (ry*ry) + Px - Py;
      } else {
        P0 = P0 + (ry*ry) + Px;
      }
      if (mode % style <= 0.5*style) {
        stroke(warna);
        stdPoint(x1+x0,y1+y0);
        stdPoint(-x1+x0,y1+y0);
        stdPoint(x1+x0,-y1+y0);
        stdPoint(-x1+x0,-y1+y0);
   
        if (!nocolor) {
          stdPoint(x1+x0-1,y1+y0-1);  
          stdPoint(-x1+x0+1,y1+y0-1);
          stdPoint(x1+x0-1,-y1+y0+1);
          stdPoint(-x1+x0+1,-y1+y0+1);
        } 
        if (tebal > 1) {
          stdPoint(x1+x0-1,y1+y0-1);
          stdPoint(-x1+x0+1,y1+y0-1);
          stdPoint(x1+x0-1,-y1+y0+1);
          stdPoint(-x1+x0+1,-y1+y0+1);
        }     
     }
     mode++;
    }
  // region 2 
  P0 = (ry*ry) * (x1+0.5) * (x1+0.5) + rx*rx*(y1-1)*(y1-1)-(rx*rx*ry*ry); 
  while (y1 > 0) {
  if (style == 1) mode=1;
  y1 -= 1;
  Py = Py - (2*rx*rx);
  if (P0 <= 0) {
     x1 += 1;
     Px = Px + (2*ry*ry);
     P0 = P0 + (rx*rx) + Px - Py;
  }else{
     P0 = P0 + (rx*rx) - Py;
  }
  if (mode % style <= 0.5*style) { 
     stroke(warna);
     stdPoint(x1+x0,y1+y0);
     stdPoint(-x1+x0,y1+y0);
     stdPoint(x1+x0,-y1+y0);
     stdPoint(-x1+x0,-y1+y0);
     if (!nocolor) {
        stdPoint(x1+x0-1,y1+y0-1);  
        stdPoint(-x1+x0+1,y1+y0-1);
        stdPoint(x1+x0-1,-y1+y0+1); 
        stdPoint(-x1+x0+1,-y1+y0+1);
     }
      if (tebal > 1 ) {     
        stdPoint(x1+x0-1,y1+y0-1);  
        stdPoint(-x1+x0+1,y1+y0-1);
        stdPoint(x1+x0-1,-y1+y0+1);
        stdPoint(-x1+x0+1,-y1+y0+1);
     }
   }
   mode++;
  }
} 
  
 // kasus ry > rx
   else {
    int x1 = 0;
    int y1 = rx;  
    stdPoint(x0,y0+ry);
    stdPoint(x0,-ry+y0);
    stdPoint(x0+rx,y0);
    stdPoint(x0-rx,y0);
    
    int P0 = (int)Math.round((rx*rx) - (ry*ry*rx + (1/4)*ry*ry));
    int Px = 0;
    int Py = 2*ry*ry*y1;
    while (Px<Py) {
      if (style==1) mode =1;
      x1 = x1 + 1;
      Px = Px + (2*rx*rx);
      if (P0 >= 0) {
        y1 -= 1;
        Py = Py - (2*ry*ry);
        P0 = P0 + (rx*rx) + Px - Py;
      } else {
        P0 = P0 + (rx*rx) + Px;
      }
      if (mode % style <= 0.5*style){
        stroke(warna);
        stdPoint((y1+y0),x1+x0);
        stdPoint((y1+y0),-x1+x0);
        stdPoint((-y1+y0),x1+x0);
        stdPoint((-y1+y0),-x1+x0);
      
        if (tebal > 1) {   
          stroke(warna);
          stdPoint(y1+y0-1,x1+x0-1);
          stdPoint(y1+y0-1,-x1+x0+1);      
          stdPoint(-y1+y0+1,x1+x0-1);
          stdPoint(-y1+y0+1,-x1+x0+1);
        }
        if (!nocolor) {
        stdPoint(y1+y0-1,x1+x0-1);
        stdPoint(y1+y0-1,-x1+x0+1);      
        stdPoint(-y1+y0+1,x1+x0-1);
        stdPoint(-y1+y0+1,-x1+x0+1);
      }
    }
    mode++;
  }
  // region 2 
    P0 = (int)Math.round((rx*rx) * (x1+0.5) * (x1+0.5) + ry*ry*(y1-1)*(y1-1)-(rx*rx*ry*ry));
    while (y1 > 0) {
      if (style==1) mode=1;
      y1 -= 1;
      Py = Py - (2*ry*ry);
      if (P0 <= 0) {
         x1 += 1;
         Px = Px + (2*rx*rx);
         P0 = P0 + (ry*ry) + Px - Py;
      } else {
         P0 = P0 + (ry*ry) - Py;
      }
      if (mode % style <= 0.5*style) {
        stroke(warna);
        stdPoint((y1+y0),x1+x0);
        stdPoint((y1+y0),-x1+x0);
        stdPoint((-y1+y0),x1+x0);
        stdPoint((-y1+y0),-x1+x0); 
        if (tebal > 1) { 
          stroke(warna);  
          stdPoint(y1+y0-1,x1+x0-1);
          stdPoint(y1+y0-1,-x1+x0+1);
          stdPoint(-y1+y0+1,x1+x0-1);
          stdPoint(-y1+y0+1,-x1+x0+1);
      }
       if (!nocolor) {
        stdPoint(y1+y0-1,x1+x0-1);
        stdPoint(y1+y0-1,-x1+x0+1);      
        stdPoint(-y1+y0+1,x1+x0-1);
        stdPoint(-y1+y0+1,-x1+x0+1);
     }
   }
   mode++;
  }
 }

}


/*
void elips (int x0, int y0, int rx, int ry, int tebal,int style,color warna, color filling,boolean nocolor)
merupakan sebuah prosedur kontrol yang memanggil prosedur membuat elips utama, parameter nya sama dengan 
prosedur buatelipsl
*/
void elips (int x0, int y0, int rx, int ry, int tebal,int style,color warna, color filling,boolean nocolor) {
  if (style ==2 ) {
     for (int i=0; i<tebal; i++) {
       buat_morse(x0,y0,rx+i,ry+i,tebal,warna);
     }
     filling(x0,y0,rx,ry,filling,nocolor);
  } else {
    for (int i=0; i<tebal; i++) {
      buatelips(x0,y0,rx+i,ry+i,tebal,style,warna,nocolor);
    }
    filling(x0,y0,rx,ry,filling,nocolor);
  }
}

/*
  void filling (int x0,int y0,int rx, int ry,color filling,boolean nocolor) 
  membuat fillig elips dengan cara mengurangi jari - jari dengan perulangan for, memiliki 6 parameter yaitu:
    x0,y0: pusat elips;
    rx   : jari - jari horizontal elips untuk dikurangi 1 demi 1
    ry   : jari - jari vertikal elips untuk dikurangi 1 demi 1
    filling : warna filling dari elips
    nocolor : menetukan diwarnai atau tidak  
*/
void filling (int x0,int y0,int rx, int ry,color filling,boolean nocolor) {
  int a=rx-1;
  int b=ry-1;
  stroke (filling);
  if (rx>ry) {
    int z = x0+rx-1;  
    // perulangan untuk menghilangkan piksel kosong
    for (int k=rx; k>=-rx; k--) {
      stdPoint(z,y0);
      z--;
    }  
    // perulangan untuk membuat elips yang lebih kecil
    for (int i =ry-1;i>=0;i--) {
      buatelips(x0,y0,a,b,1,1,filling,nocolor);
      a-=1;
      b-=1;
    } 
  }
  if (ry>rx){
     int z = y0+ry-1;
     // perulangan untuk menghilangkan piksel kosong
     for (int k=ry; k>=-ry; k--) {
       stdPoint(x0,z);
       z--;
     }
     // perulangan untuk membuat elips yang lebih kecil
     for (int i =rx-1;i>=0;i--) {
      buatelips(x0,y0,a,b,1,1,filling,nocolor);
      a-=1;
      b-=1;
    } 
  }
}


/*void buat_morse(int x0, int y0,int rx,int ry,int tebal,color warna)
  membuat elips dengan motif moerse
*/
void buat_morse(int x0, int y0,int rx,int ry,int tebal,color warna){
    int a=1; int c;
    int morse=0;
    int tulis=0;
    if (rx > ry) {
    int x1 = 0;
    int y1 = ry;  
    stdPoint(x0, ry+y0);
    stdPoint(x0,-ry+y0);
    stdPoint(rx+x0, y0);
    stdPoint(-rx+x0, y0);
    float P0 = (ry*ry) - (rx*rx*ry + (1/4)*rx*rx);
    int Px = 0;
    int Py = 2*rx*rx*y1;
    while (Px<Py) {
      if (morse % 21 ==0) { c= tulis; tulis = a; a=c ;} 
      x1 = x1 + 1;
      Px = Px + (2*ry*ry);
      if (P0 >= 0) {
        y1 -= 1;
        Py = Py - (2*rx*rx);
        P0 = P0 + (ry*ry) + Px - Py;
      } else {
        P0 = P0 + (ry*ry) + Px;
      }
      if (tulis ==1 || morse % 21==11) {
        stroke(warna);
        stdPoint(x1+x0,y1+y0);
        stdPoint(-x1+x0,y1+y0);
        stdPoint(x1+x0,-y1+y0);
        stdPoint(-x1+x0,-y1+y0);
        if (tebal > 1) {
          stdPoint(x1+x0-1,y1+y0-1);
          stdPoint(-x1+x0+1,y1+y0-1);
          stdPoint(x1+x0-1,-y1+y0+1);
          stdPoint(-x1+x0+1,-y1+y0+1);
        } 
      }  
    morse++;  
    }
    
  // region 2 
  P0 = (ry*ry) * (x1+0.5) * (x1+0.5) + rx*rx*(y1-1)*(y1-1)-(rx*rx*ry*ry); 
  while (y1 > 0) {
  if (morse % 21 ==0) { c= tulis; tulis = a; a=c ;} 
  y1 -= 1;
  Py = Py - (2*rx*rx);
  if (P0 <= 0) {
     x1 += 1;
     Px = Px + (2*ry*ry);
     P0 = P0 + (rx*rx) + Px - Py;
  }else{
     P0 = P0 + (rx*rx) - Py;
  }
   if (tulis ==1 || morse % 21==11) {
     stroke(warna);
     stdPoint(x1+x0,y1+y0);
     stdPoint(-x1+x0,y1+y0);
     stdPoint(x1+x0,-y1+y0);
     stdPoint(-x1+x0,-y1+y0);
     if (tebal > 1 ) {     
        stdPoint(x1+x0-1,y1+y0-1);  
        stdPoint(-x1+x0+1,y1+y0-1);
        stdPoint(x1+x0-1,-y1+y0+1);
        stdPoint(-x1+x0+1,-y1+y0+1);
     }
   }
   morse++;
  }
} 
  
 // kasus ry > rx
   else {
    int x1 = 0;
    int y1 = rx;  
    stdPoint(x0,y0+ry);
    stdPoint(x0,-ry+y0);
    stdPoint(x0+rx,y0);
    stdPoint(x0-rx,y0);
    
    int P0 = (int)Math.round((rx*rx) - (ry*ry*rx + (1/4)*ry*ry));
    int Px = 0;
    int Py = 2*ry*ry*y1;
    while (Px<Py) {
      if (morse % 21 ==0) { c= tulis; tulis = a; a=c ;}
      x1 = x1 + 1;
      Px = Px + (2*rx*rx);
      if (P0 >= 0) {
        y1 -= 1;
        Py = Py - (2*ry*ry);
        P0 = P0 + (rx*rx) + Px - Py;
      } else {
        P0 = P0 + (rx*rx) + Px;
      }
      if (tulis ==1 || morse % 21 ==11) {
        stroke(warna);
        stdPoint((y1+y0),x1+x0);
        stdPoint((y1+y0),-x1+x0);
        stdPoint((-y1+y0),x1+x0);
        stdPoint((-y1+y0),-x1+x0);
      
        if (tebal > 1) {   
          stroke(warna);
          stdPoint(y1+y0-1,x1+x0-1);
          stdPoint(y1+y0-1,-x1+x0+1);      
          stdPoint(-y1+y0+1,x1+x0-1);
          stdPoint(-y1+y0+1,-x1+x0+1);
       }
    }
    morse++;
  }
  // region 2 
    P0 = (int)Math.round((rx*rx) * (x1+0.5) * (x1+0.5) + ry*ry*(y1-1)*(y1-1)-(rx*rx*ry*ry));
    while (y1 > 0) { 
      if (morse % 21 ==0) { c= tulis; tulis = a; a=c ;}
      y1 -= 1;
      Py = Py - (2*ry*ry);
      if (P0 <= 0) {
         x1 += 1;
         Px = Px + (2*rx*rx);
         P0 = P0 + (ry*ry) + Px - Py;
      } else {
         P0 = P0 + (ry*ry) - Py;
      }
      if (tulis ==1 || morse % 21 ==11) {
        stroke(warna);
        stdPoint((y1+y0),x1+x0);
        stdPoint((y1+y0),-x1+x0);
        stdPoint((-y1+y0),x1+x0);
        stdPoint((-y1+y0),-x1+x0); 
        if (tebal > 1) { 
          stroke(warna);  
          stdPoint(y1+y0-1,x1+x0-1);
          stdPoint(y1+y0-1,-x1+x0+1);
          stdPoint(-y1+y0+1,x1+x0-1);
          stdPoint(-y1+y0+1,-x1+x0+1);
      }
     }
     morse++;
   }
 }
}

void translasi (int x0,int y0,int rx,int ry,int tebal,int modeStyle,color warna,color filling,boolean nocolor,int tx,int ty) {
  int xr=0;
  xr=x0+tx;
  int yr=0;
  yr=y0+ty;
  elips(xr,yr,rx,ry,tebal,modeStyle,warna,filling,nocolor);
}

void scaling(int x0,int y0,int rx,int ry,int tebal,int modeStyle,color warna,color filling,boolean nocolor,float s){
  int xr = (int)Math.round(rx*s);
  int yr = (int)Math.round(ry*s);
  elips(x0,y0,xr,yr,tebal,modeStyle,warna,filling,nocolor);
}
//--------------------------------- silahkan ditulis dibawah sini

// -------------------------------- normalisasi, ga perlu dirubah

void stdPoint(int xxx, int yyy)
{
  point(xxx+(canvasW/2), (yyy*-1)+(canvasH/2));
}

void drawHelpLines()
{
  stroke(0, 0, 255);
  for (int z=0; z<canvasW; z=z+1) {
    point((canvasW/2), z);
    point(z, (canvasH/2));
  }
  stroke(0, 0, 0);
}
