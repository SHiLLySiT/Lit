# Lit
A simple lighting engine for FlashPunk. 

#### Features
* only the lights on screen are rendered
* supports different light images
* supports rotating lights

#### Usage
Create a new lighting object and add it to the world:
```ActionScript
add(lighting = new Lighting(FP.screen.width, FP.screen.height));
```

Then add some lights to it:
```ActionScript
var image:Image = new Image(LIGHT);
lighting.add(new Light(100, 100, image))
```

#### Tips
* make lights rotate by changing their "rotate" property
* toggle lights on and off by setting their "active" property

# Changelog
Version 1.0.0 (June 27th, 2013) 
* Initial Commit
