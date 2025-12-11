float centerX = 400;
float centerY = 400;
float zoom = 160;

int boundcheck(float Cr, float Ci)
{
    double Zr = 0;
    double Zi = 0;
    int i = 0;
    while(i<50)
    {
        double tempZr = Zr;
        Zr = (pow((float)Zr, 2)-pow((float)Zi, 2))+ Cr;
        Zi = 2*(tempZr*Zi)+Ci; 
        //println(Zi + "i + " + Zr);
        if(Math.hypot(Zi, Zr) > 2) break;
        i+=1;
    }
    return i;
}
void setup()
{
    size(800 , 800);
    boundcheck(0, 1);
}
void mousePressed()
{
    float mx = mouseX;
    float my = mouseY;
    float oldZoom = zoom;
    float Cr_mouse = (mx - centerX) / oldZoom;
    float Ci_mouse = (my - centerY) / oldZoom;


    float zoomFactor = 1.5;
    zoom *= zoomFactor;

    
    centerX = mx - Cr_mouse * zoom;
    centerY = my - Ci_mouse * zoom;
}
void draw()
{
    if(frameCount % 30 == 0)
    {
    background(255);
    for(int i = 0; i <= 800; i+=1)
    for(int j = 0; j <= 800; j+=1)
    {
        stroke(boundcheck((j-centerX)/zoom, (i-centerY)/zoom) *255 / 50);
        strokeWeight(1);
        point(j, i);      
    }
    }
    

}
