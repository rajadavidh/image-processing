// STANDAR TEMPLATE TUBES GRAFCIT @IT TELKOM | 2011
//--------------------------------- inisialisasi, ga perlu dirubah
static int canvasW = 600;
static int canvasH = 600;
void setup() {
  size(canvasW, canvasH);
  background(220);
  }
//--------------------------------- variable global ditulis disini

//-------------------------------variabel buat koding
int r = 100;
int x0 = 100;
int y0 = 200;
int tx=0;
int ty=-400;
int tebal = 10;
boolean nocolor=false;
color filling = color (0,255,255); 
char mode = 0;  // pilihan untuk style nya



//--------------------------------- disini mulai codingnya
void draw() {
  drawHelpLines();
  color warnaku = color(255, 0, 0);     
  if (mode==0){
    lingkaran_putus(x0,y0,r,tebal,warnaku);
    if (tebal >1) {
      for (int a=1; a<tebal;a++) {
        lingkaran_putus(x0,y0,r+a,tebal,warnaku);
      }
    }
  }
  else if(mode==1){ 
    buat_tebal(x0,y0,r,tebal,warnaku,nocolor); 
  } else if(mode==2){ 
  
    lingkaran_morse(x0,y0,r,tebal,warnaku); 
   
  }
  if (!nocolor) {
    filling(x0,y0,r,filling,nocolor);
  }
  translasi(x0,y0,r,tebal,warnaku,nocolor,mode);
}
//------------------------------algoritma mid point  
//tebal
void lingkaran_tebal(int x0,int y0,int r,int tebal,color warnaku,boolean nocolor){
  int x = 0;
  int y = r;
  int x2 = x0;
  int y2 = r+tebal;
  int xTebal = x0;
  int yTebal = y0+r+1;
  float p = 1-r;
  float p2 = 1-(r+tebal);
  stroke(warnaku);
  stdpoint(x0,y0);
  stdpoint(x+x0,y+y0);
  stdpoint(x+x0,-y+y0);
  stdpoint(y+x0,x+y0);
  stdpoint(-y+x0,x+y0);
  while(x<=y){
     if(p<0){
      x= x+1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x-2*y+1;
    }
    if(tebal>1){
      stdpoint(x+x0-1,y+y0-1);
      stdpoint(y+x0-1,x+y0-1);
      stdpoint(-x+x0+1,y+y0-1);
      stdpoint(y+x0-1,-x+y0+1);
      stdpoint(-x+x0+1,-y+y0+1);
      stdpoint(-y+x0+1,-x+y0+1);
      stdpoint(x+x0-1,-y+y0+1);
      stdpoint(-y+x0+1,x+y0-1);
    }
    if (!nocolor) {
      stdpoint(x+x0-1,y+y0-1);
      stdpoint(y+x0-1,x+y0-1);
      stdpoint(-x+x0+1,y+y0-1);
      stdpoint(y+x0-1,-x+y0+1);
      stdpoint(-x+x0+1,-y+y0+1);
      stdpoint(-y+x0+1,-x+y0+1);
      stdpoint(x+x0-1,-y+y0+1);
      stdpoint(-y+x0+1,x+y0-1);
    }
    
      
  }
}

void buat_tebal(int x0,int y0,int r,int tebal,color warnaku,boolean nocolor){
   for(int i=0;i<tebal;i++){
    lingkaran_tebal(x0,y0,r+i,tebal,warnaku,nocolor);
   }
}





void lingkaran_putus(int x0,int y0,int r,int tebal,color warnaku){
  int x = 0;
  int y = r;
  int x3 = x0+1;
  int y3 = y0+1;
  float p = 1-r;
  stroke(warnaku);
  stdpoint(x0,y0);
  stdpoint(x+x0,y+y0);
  stdpoint(x+x0,-y+y0);
  stdpoint(y+x0,x+y0);
  stdpoint(-y+x0,x+y0);
  for(int c=tebal-1; c>=0; c--){
  while(x<=y){
     for(int i=0;i<20;i++){
       if(tebal>1){
      stdpoint(x+x0-1,y+y0-1);
      stdpoint(y+x0-1,x+y0-1);
      stdpoint(-x+x0+1,y+y0-1);
      stdpoint(y+x0-1,-x+y0+1);
      stdpoint(-x+x0+1,-y+y0+1);
      stdpoint(-y+x0+1,-x+y0+1);
      stdpoint(x+x0-1,-y+y0+1);
      stdpoint(-y+x0+1,x+y0-1);
    }
   if(p<0){
      x= x+1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x-2*y+1;
    }
    i++;
  }
    for(int j=0;j<20;j++){
   if(p<0){
      x= x+1;
      /*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;/*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x-2*y+1;
    }
    j++;
  }
 }
 } 
}


void lingkaran_morse(int x0,int y0,int r,int tebal,color warnaku){
  int x = 0;
  int y = r;
  tebal=tebal-1;
  int x3 = x0+1;
  int y3 = y0+1;
  float p = 1-r;
  stroke(warnaku);
  stdpoint(x0,y0);
  stdpoint(x+x0,y+y0);
  stdpoint(x+x0,-y+y0);
  stdpoint(y+x0,x+y0);
  stdpoint(-y+x0,x+y0);
  
  while(x<=y){
     for(int i=0;i<20;i++){
   if(p<0){
      x= x+1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x-2*y+1;
    }
    i++;
  }
    for(int j=0;j<20;j++){
   if(p<0){
      x= x+1;
      /*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;/*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x-2*y+1;
    }
    j++;
  }
  
  for(int k=0;k<2;k++){
   if(p<0){
      x= x+1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x-2*y+1;
    }
    k++;
  }
  
  for(int l=0;l<20;l++){
   if(p<0){
      x= x+1;
      /*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;/*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x-2*y+1;
    }
    l++;
  }
  
  for(int m=0;m<2;m++){
   if(p<0){
      x= x+1;
      
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);
      p=p+2*x-2*y+1;
    }
    m++;
  }
  
  for(int n=0;n<20;n++){
   if(p<0){
      x= x+1;
      /*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x+1;
    }
    else{
      x= x+1;
      y= y-1;/*
      stdpoint(x+x0,y+y0);
      stdpoint(y+x0,x+y0);
      stdpoint(-x+x0,y+y0);
      stdpoint(y+x0,-x+y0);
      stdpoint(-x+x0,-y+y0);
      stdpoint(-y+x0,-x+y0);
      stdpoint(x+x0,-y+y0);
      stdpoint(-y+x0,x+y0);*/
      p=p+2*x-2*y+1;
    }
    n++;
  }
  
  
 }
  
}


//filling
void filling(int x0,int y0,int r,color warnaku ,boolean nocolor) {
  int b=1;
  for (int a=r-1;a>=0;a--) {
    buat_tebal(x0,y0,r-b,1,warnaku,nocolor);
    b++;
  }
}

void translasi (int x0,int y0,int r,int tebal,color warnaku,boolean nocolor, int mode){
  int xp = x0+tx;
  int yp = y0+ty;
  if(mode == 1){
  buat_tebal(xp,yp,r,tebal,warnaku,nocolor);
  if (!nocolor) {
    filling(xp,yp,r,filling,nocolor);
  }
 }else if(mode == 0){
 lingkaran_putus(xp,yp,r,tebal,warnaku);
  if (tebal >1) {
      for (int a=1; a<tebal;a++) {
        lingkaran_putus(xp,yp,r+a,tebal,warnaku);
      }
    }
  if (!nocolor) {
    filling(xp,yp,r,filling,nocolor);
  }
 }
}
 
void warna (int x,int y,color warnaku) {
//color boundcol = get(x0+canvasW/2, (y0*-1)+canvasH/2);
color curcol = get(x+canvasW/2, (y*-1)+canvasH/2);
 if ((curcol!=warnaku)&&(curcol!=color (0,0,255))){ 
  stdpoint(x,y);
  warna(x+1,y,warnaku);
  warna(x-1,y,warnaku);
  warna(x,y+1,warnaku);
  warna(x,y-1,warnaku);
  }
}
// -------------------------------- normalisasi, ga perlu dirubah

void stdpoint(int xxx, int yyy)
{
  point(xxx+canvasW/2, (yyy*-1)+canvasH/2);
  
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
