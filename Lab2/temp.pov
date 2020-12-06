#include "colors.inc"  
#include "textures.inc"

sphere { <-2.94,0,-0.51> 2 pigment { Black } finish { ambient 0.2 diffuse .2 phong 0.3 phong_size 10} }

camera { 

    perspective 
    location <9.6,9.059999999999986,-2.8000000000000003>  
    look_at <0,1.5,0>    
    
    }


 plane
    {
    <0, 1, 0>, -2
     texture {
      pigment {
        DMFWood4       // pre-defined in textures.inc
                // scale by the same amount in all
   } 
   
   
    normal { dents .75 scale .25 }
    }
    
}     
 

        

union {   

cylinder { 

    <0,4.5,0>,<0,3.5,0>,.27
     
    texture{
    
        pigment { color SpicyPink }
        
        }
        
        finish { roughness 10 }
        
        }
         
cylinder { 

    <0,3.8,0>,<0,3,0>,.28
     
    texture{
    
        Silver_Metal 
        
        }
        
        finish { ambient .2
      diffuse .6
      phong .85
      phong_size 10
        
        }
              
        }

cylinder {
         <0,3.5,0>,
         <0,-1,0>,
         .27   
          texture{ pigment { color Yellow }
         } 
         }
         
cone {
     <0,-1,0>,
     .27
     <0,-2,0>,
     0  
    pigment { color Brown }
                     
                    
}

 cone {
     <0,-1.8,0>,
     .06
     <0,-2,0>,
     0  
    pigment { color Black }
                     
                    
}  
                    
 normal { dents .75 scale .30 }    
}     


difference {      
sphere  {  
         <1.1,1,0> 
         2
        
        }
           
sphere  {
         <.4,1,0> 
         2
     
        } 
        
        
         pigment { Blue }  
                 finish {
      diffuse .6
      phong .75
      phong_size 25}
        
        
        }    
        
        
light_source { <20, 20, 0> color White} //the light is in place
light_source { <clock+10, 30, -18> color White}  //the light moves behind the camera