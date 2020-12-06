import re
import os
import math
import Lab2Module as l

#---------------------------------------------
#Teacher starter code for opening file, reading and closing file
#---------------------------------------------
fin = open( "base.pov" )
sdl = fin.read() # Read the entire file into a string
fin.close()








#set the radius and theta
radius = 10
theta = 0
yCoordinate =0






#---------------------------------------------------------------------
#Part2 I deserve points because I used a list, tuple and dictionary
#created a list to store tuples of x and z coordinates of the camera location 
#during each iteration. This displays the use of pythons lists and tuples as it puts 
#records of the cameras x and z coordinates which can be 
#reused to allow another object to follow the same path.
#---------------------------------------------------------------------
thisList = []







#---------------------------------------------------------------------
#Part2 use dictionary
#I deserve points because this dictionary is integral in troubleshooting 
#by listing all coordinates of the camera
#in an easy to read format I was able to see 
#if my program was veering of course because
#of some unknown arihtmetic error
#---------------------------------------------------------------------
mydict={}








count = 0
while count < 151 :
#---------------------------------------------
#Teacher starter code for rendering images with povray, and writing to file
#---------------------------------------------
    outfile = "temp.pov"
    fout = open( outfile, "w" )
    fout.write( sdl )
    fout.close()   
    #......rendering images via pvengine
    pov_cmd = 'pvengine.exe +I%s +O%s -D -V +A0.3 /EXIT +H1080 +W1920'
    cmd = pov_cmd % ('temp.pov',  "temp" + str(count).zfill(3) + ".png")
    os.system(cmd)




    
    
#---------------------------------------------------------------------
#Part 1 camera pan 
#I deserve points because this meets the requirements of part 1
#Multiplied cos(theta) and sin(theta) by the radius 
#Used pythons string.format method to create a new location vector
#---------------------------------------------------------------------
    xCoordinate=   radius * round(math.cos(theta),2)
    zCoordinate=   radius * round(math.sin(theta),2)
    yCoordinate+=.06

#Used regular expression re.sub to insert 
    newLocation = '<{0},{1},{2}>'.format(xCoordinate, yCoordinate, zCoordinate)
    sdl = re.sub("<.+>", newLocation, sdl, 1)
    
    mydict["camera coordinate " + str(count)] = newLocation
    count +=1
    theta +=.04
    
    
    
    
    
    
#---------------------------------------------------------------------
#created a list of tuples to keep track of the x and z coordinates
#of my camera during each iteration
#---------------------------------------------------------------------
    thistuple = (xCoordinate, zCoordinate)
    thisList.append(thistuple)
    

    
    
    
    
    
    
    
    
    
    
#---------------------------------------------------------------------
#PART 2
#I deserve points because I created a module called Lab2Module
# and in it I defined a sphere class that has
#3 attributes and a __repr__ method that returns a stirng
#that I could insert into the PovRay code.
#Created one sphere object from my class and inserted it into my PovRay code
#the sphere class also has a static member called color. All spheres are created
#with the same color.
#---------------------------------------------------------------------
sphere1 = l.sphere()
idx = sdl.index('camera')
sphere1String = sphere1.__repr__()


sdl2 = sdl[:idx] + sphere1String + sdl[idx:]










#---------------------------------------------------------------------
#Part2 I deserve points because I used keyword arguments, i.e. **kwargs to
#created a function in the lab2Module
#that takes key word arguments and converts them into 
#a string containing povray syntax for applying finish attributes and settings.
#I then use re.sub to insert this string into the sphere that I created.
#---------------------------------------------------------------------
myCircleFinish = l.finishFunc(ambient=.2, diffuse=".2", phong=.3, phong_size=10)

sdl2 = re.sub("\}.+\}", myCircleFinish, sdl2, 1)






radius = 3
theta = 0
yCoordinate =0




#---------------------------------------------------------------------
#Part2 python code needs to read in the input file and then
#search/find/match for the part you’re
#wanting to change, change it. 
#I deserve points because Now I'm going to use re.sub to continually 
#replace the location of my 
#Black sphere that I just created.
#Used regular expression re.sub to insert 
#---------------------------------------------------------------------
sphereXCoordinate = 3
sphereYCoordinate = 0
sphereZCoordinate = 0



while count < 201 :

    outfile = "temp.pov"
    fout = open( outfile, "w" )
    fout.write( sdl2 )
    fout.close()   
    #......rendering images via pvengine
    pov_cmd = 'pvengine.exe +I%s +O%s -D -V +A0.3 /EXIT +H1080 +W1920'
    cmd = pov_cmd % ('temp.pov',  "temp" + str(count).zfill(3) + ".png")
    os.system(cmd)
    
    
    sphereXCoordinate=   radius * round(math.cos(theta),2)
    sphereZCoordinate=   radius * round(math.sin(theta),2) 
    sphereNewLocation = '<{0},{1},{2}>'.format(sphereXCoordinate, sphereYCoordinate, sphereZCoordinate)
    sdl2 = re.sub("<.+>", sphereNewLocation, sdl2, 1)
    
    count +=1
    theta +=.2
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    

#print my list of x and z coordinates which represnt the circular path 
#of the camera without the y coordinates for ascending
l.printList(thisList)
        
    
#print out my dictionary of coordinates for camera for
#testing purposes
l.printDict(mydict)






#---------------------------------------------
#Teacher starter code
#---------------------------------------------
print("Encoding movie")
os.system("ffmpeg -loglevel panic -start_number 1 -i  temp%03d.png -c:v libx264 \
-r 25 -s 1920x1080 -pix_fmt yuv420p movie.avi")







