#include "DxLib.h"
#include <stdio.h>
#include <math.h>
#include <string>
using namespace std;

#define byte BYTE

#define SHORT

void loadg();


// std::string is used

// During the program
// main-10
// title-100
int mains=100,maintm=0;

// Stage
int stagecolor=0;
int sta=1,stb=4,stc=0;

// Quick (high speed?)
int fast=1;

// Trap display
int trap=1;

// Intermediate gate (save point)
int tyuukan=0;


// Staff roll
int ending=0;


// Stage read loop (do not touch)
int stagerr,stagepoint;
// Overflow
int over=0;

// Stage switch
int stageonoff=0;


// Main program
void Mainprogram();
void rpaint();
int maint;


// Subclass (utils?)
// (Weight class (or wait, "synchronous functions"?)
static void wait(int interval);
static void wait2(long stime, long etime,int FLAME_TIME);
static int rand(int Rand);
void end();

// Draw
int color;
void setfont(int a);
void setcolor(int red, int green, int blue);
void setc0();
void setc1();
void drawpixel(int a,int b);
void drawline(int a,int b,int c,int d);
void drawrect(int a,int b,int c,int d);
void fillrect(int a,int b,int c,int d);
void drawarc(int a,int b,int c,int d);
void fillarc(int a,int b,int c,int d);
int grap[161][8],mgrap[51];
int loadimage(const string &b);
int loadimage(int a,int x,int y,int r,int z);
int mirror;
void drawimage(int mx,int a,int b);
void drawimage(int mx,int a,int b,int c,int d,int e,int f);
void setre();
void setre2();
void setno();
int oto[151];
void ot(int x);void bgmchange(int x);

// Text
void str(const string &c,int a,int b);


// )

void stagecls();
void stage();
void stagep();





// 1-stage
// 10-before the stage
//



// loop (loop variables?)
int t,tt,t1,t2,t3,t4;


// Initialize
int zxon,zzxon;

// Key config
int key,keytm;

// Trigonometric function
double pai=3.1415926535;


// Ground
#define smax 31
int sx,sco;
int sa[smax],sb[smax],sc[smax],sd[smax],stype[smax],sxtype[smax],sr[smax];
int sgtype[smax];



// Player
int mainmsgtype;
int ma,mb,mnobia,mnobib,mhp;
int mc,md,macttype,atkon,atktm,mactsok,msstar,nokori=2,mactp,mact;

int mtype,mxtype,mtm,mzz;
int mzimen,mrzimen,mkasok,mmuki,mmukitm,mjumptm,mkeytm,mcleartm;
int mmutekitm,mmutekion;
int mztm,mztype;
int actaon[7];
// Message
int mmsgtm,mmsgtype;

int mascrollmax=21000;//9000




// Block
void tyobi(int x,int y,int type);
void brockbreak(int t);
#define tmax 641
int tco;
int ta[tmax],tb[tmax],tc[tmax],td[tmax],thp[tmax],ttype[tmax];
int titem[tmax],txtype[tmax];

// Message block
int tmsgtm,tmsgtype,tmsgx,tmsgy,tmsgnobix,tmsgnobiy,tmsg;
void ttmsg();void txmsg(const string &x,int a);
void setfont(int x,int y);

// Ineffective Graphics
void eyobi(int xa,int xb,int xc,int xd,int xe,int xf,int xnobia,int xnobib,int xgtype,int xtm);
#define emax 201
int eco;
int ea[emax],eb[emax],enobia[emax],enobib[emax],ec[emax],ed[emax];
int ee[emax],ef[emax],etm[emax];
int egtype[emax];



// Enemy character
void ayobi(int xa,int xb,int xc,int xd,int xnotm,int xtype,int xxtype);
void tekizimen();
#define amax 24
int aco;
int aa[amax],ab[amax],anobia[amax],anobib[amax],ac[amax],ad[amax];
int ae[amax],af[amax],abrocktm[amax];
int aacta[amax],aactb[amax],azimentype[amax],axzimen[amax];
int atype[amax],axtype[amax],amuki[amax],ahp[amax];
int anotm[amax],anx[160],any[160];
int atm[amax],a2tm[amax];
int amsgtm[amax],amsgtype[amax];

// Enemy appearance
#define bmax 81
int bco;
int ba[bmax],bb[bmax],btm[bmax];
int btype[bmax],bxtype[bmax],bz[bmax];


// Background
#define nmax 41
int nxxmax,nco;
int na[nmax],nb[nmax],nc[nmax],nd[nmax],ntype[nmax];
int ne[nmax],nf[nmax],ng[nmax],nx[nmax];


// Lift
#define srmax 21
int srco;
int sra[srmax],srb[srmax],src[srmax],srd[srmax],sre[srmax],srf[srmax];
int srtype[srmax],srgtype[srmax],sracttype[srmax],srsp[srmax];
int srmuki[srmax],sron[srmax],sree[srmax];
int srsok[srmax],srmovep[srmax],srmove[srmax];





// Scroll range
int fx=0,fy=0,fzx,fzy,scrollx,scrolly;
// Overall point
int fmx=0,fmy=0;
// Forced scroll
int kscroll=0;
// Screen size (NES size × 2) (256-224)
int fxmax=48000,fymax=42000;



// Satge
byte stagedate[17][2001];

// Screen black
int blacktm=1,blackx=0;



// Free values
int xx[91];
double xd[11];
string xs[31];


// Timer measurement
long stime;
