class Platform {
    private float x, y;//Initial position of the platform x,y (point in the upper left corner)
    private float w, h;//width height
    private float moveSpeed; //move speed,1 by default. downward
    private PImage image; //platform pic
    
    Platform(float x, float y, float w, float h, PImage image, float moveSpeed) {
        this.moveSpeed = moveSpeed; 
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.image = image;
    }
    
    void display() {
        image(this.image, this.x, this.y, this.w, this.h);
    }
    
    void update() {
        this.y += moveSpeed; //Move up and update the position of y
    }
}
