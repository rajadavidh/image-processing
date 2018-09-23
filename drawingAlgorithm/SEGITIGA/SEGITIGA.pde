// STANDAR TEMPLATE TUBES GRAFCIT @IT TELKOM | 2011
//--------------------------------- inisialisasi, ga perlu dirubah
static int canvasW = 600;
static int canvasH = 600;
void setup() {
  size(canvasW, canvasH);
  background(255);
}

//--------------------------------- variable global ditulis disini

int x1 = 10;
int y1 = 10;
int x2 = 120;
int y2 = 100;
int x3 = 100;
int y3 = 120;


//--------------------------------- disini mulai codingnya
void draw() {
  drawHelpLines();
  gambarsegitiga ();  
} 

//--------------------------------- procedure/fungsi bikinan sendiri
//--------------------------------- silahkan ditulis dibawah sini
void gambarsegitiga () {
  gambargaris (x1,y1,x2,y2);
  gambargaris (x1,y1,x3,y3);
  gambargaris (x2,y2,x3,y3);
  
}

void gambargaris(int xx1, int yy1, int xx2, int yy2){
  //variabel lokal
  int dx = abs(xx2-xx1);
  int dy = abs(yy2-yy1);
  int P;
  int x,y,awal,akhir;
  
  //modifikasi inputan ke bresenham  
  if (dy>dx) {
   //swap
   if (yy1<yy2){
    awal = yy1;
    akhir = yy2;
   } else {
    awal = yy2;
    akhir = yy1;
   }			
   P = 2*dx-dy;
  } else {
   //tetap
   if (xx1<xx2){
    awal = xx1;
    akhir = xx2;
   } else {			
     awal = xx2;
     akhir = xx1;
   }		
   P = 2*dy-dx;
  }
 
  //plot x0,y0
  x = xx1;
  y = yy1;
  stdPoint(x,y);
  
  //perulangan bresenham
  for (int i = awal; i < akhir; i++) {
    
    if (P<0) {    
    
     if (dy>dx) {
       //swap
        if (yy1<yy2){
          y++;
        } else {
          y--;
        }
        stdPoint(x,y);
        P += 2*dx;
     } else {
       //tetap
        if (xx1<xx2){
          x++;
        } else {
          x--;
        }
        stdPoint(x,y);
        P += 2*dy;
     }
     
   } else {
     if (yy1<yy2) {
       if (xx1<xx2) {
         //kuadran 1
         x++;        
       } else {
         //kuadran 2
         x--;
       }
       y++; 
     } else {
       if (xx1<xx2) {
         //kuadran 4
         x++;        
       } else {
         //kuadran 3
         x--;
       }
       y--;
     }
     
     stdPoint(x,y);
     if (dy>dx) {
       //swap
       P += 2*dx-2*dy;
     } else {
       //tetap
       P += 2*dy-2*dx;
     }
     
   }
   
  }
 
} 


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
