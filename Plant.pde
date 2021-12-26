class Plant extends Animate {
  //Properties
  int neighbors;
  float density;
  int seedEnergy;
 
  //Mutations
  float densityMutation;
  int seedEnergyMutation;
  
  Plant(int aX, int aY, int aAge, float aLightDistance, float aWaterDistance, int aNeighbors, float aLightMeter, float aWaterMeter, float aDensity, float aEnergy, float aLifespan, int aFertileAgeLow, int aFertileAgeHigh, int aSeedEnergy, float aLightMeterMutation, float aWaterMeterMutation, float aDensityMutation, float aLifespanMutation, int aFertileAgeLowMutation, int aFertileAgeHighMutation, int aSeedEnergyMutation, color acolorID) {
    x = aX;
    y = aY;
    age = aAge;
    lightDistance = aLightDistance;
    waterDistance = aWaterDistance;
    neighbors = aNeighbors;
    lightMeter = aLightMeter;
    waterMeter = aWaterMeter;
    density = aDensity;
    energy = aEnergy;
    lifespan = aLifespan;
    fertileAgeLow = aFertileAgeLow;
    fertileAgeHigh = aFertileAgeHigh;
    seedEnergy = aSeedEnergy;
    lightMeterMutation = aLightMeterMutation;
    waterMeterMutation = aWaterMeterMutation;
    densityMutation = aDensityMutation;
    lifespanMutation = aLifespanMutation;
    fertileAgeLowMutation = aFertileAgeLowMutation;
    fertileAgeHighMutation = aFertileAgeHighMutation;
    seedEnergyMutation = aSeedEnergyMutation;
    colorID = #33dd00;
  }

  void display () {
    detection();
    stroke(#24B93B);
    strokeWeight(3);
    fill(colorID);
    bezier(x,y,x,y-10,x,y+20,x+20*cos(wind_angle+random(-.1,.1)),y+20*sin(wind_angle+random(-.1,.1)));
  }

  void detection() {
    lightDistance = dist(x, y, light_x, light_y);
    waterDistance = dist(x, y, water_x, water_y);
    neighbors = -1;
    for (int i = Plant_list.size()-1; i >= 0; i--) {
      Plant Plant_object = (Plant) Plant_list.get(i);
      float neighborDistance = dist(x, y, Plant_object.x, Plant_object.y);
      if (neighborDistance < 50) {
        neighbors++;
        constrain(neighbors, 0, 200);
      }
    }
    levels();
  }

  void levels() {
    lightMeter = constrain((1 / sq(lightDistance)) + lightMeterMutation, 0, 100);
    waterMeter = constrain((100 - pow(map(waterDistance, 0, dist(0, 0, width, height), 0, 100), 1.25) + waterMeterMutation), 0, 100);
    density = constrain((pow(map(neighbors, 0, 50, 0, 100), 1.25) - densityMutation), 0, 100);
    if (lightMeter != 0 && waterMeter != 0) {
      energy= (lightMeter * 0.3 + waterMeter * 0.5 + density * 0.2);
    }
    else {
      energy = 0;
    }
  }


  boolean update_age() {  //Updates age, returns True if still alive, returns False if plant is over lifespan and will die
    lifespan = pow(energy, 1.75);
    update_color();
    if (energy < 25) {
      return false;
    }
    if (age < lifespan) {
      age++;
      return true;
    }
    else {
      return false;
    }
  }

  void update_color() {
    //start r=36,g=185,b=59;
    //final r=111, g=84, b=15
    println(lifespan);
    float percentComplete = age/lifespan*100;
    colorID = color(map(percentComplete, 0, 100, 36, 111), 185 - map(percentComplete, 0, 100, 0, 101), 59 - map(percentComplete, 0, 100, 0, 44));
  }

  void die() { //Dieing Animation
  }
}










