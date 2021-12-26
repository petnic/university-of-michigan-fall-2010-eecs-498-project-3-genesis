ArrayList Plant_list;
ArrayList Seed_list;

float wind_angle=PI;

int light_x=400;
int light_y=400;

int water_x=800;
int water_y=400;

//Plant p1 =new Plant(600, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

void setup() {
  size (1200,800);
  smooth();
  Plant_list= new ArrayList();
  Seed_list= new ArrayList();
}

void draw() {
  wind_angle+=random(-.1,.1);
  background(152);
  stroke(255);
  strokeWeight(2);
  light_display();
  fill(#2674D1);
  ellipse(water_x, water_y, 100, 100);  
  for (int i = Plant_list.size()-1; i >= 0; i--) { 
    Plant Plant_object = (Plant) Plant_list.get(i);
    //  println(Plant_object.energy);
    if (Plant_object.update_age()==true) {
      Plant_object.display();
    }
    else { 
      Plant_object.die();
      Plant_list.remove(i);
    }
  }
}


void mousePressed() {
  for (int i=0 ; i<300 ; i++) {
    Plant_list.add(new Plant(floor(random(0,width)), floor(random(0,height)), 0, 0, 0, 0, 0, 0, 0, 30, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,255));
  }
}

void light_display() {
  fill(255);
  strokeWeight(1);
  stroke(243,255,116);
  ellipse(light_x,light_y,75,75);
  noFill();
  for (int i=0 ; i<50; i++) {
    stroke(243,255,116,255-5*i);
    ellipse(light_x,light_y,75+i,75+i);
  }
}
