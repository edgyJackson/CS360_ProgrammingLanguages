#creates a sphere object
class sphere:
    color = "Black"
    def __init__(self, location = '<5,0,0>', diameter = 2):
        self.location = location
        self.diameter = diameter
    #return self as a string
    def __repr__(self):

        return "sphere {{ {0} {1} pigment {{ {2} }} }}\n\n".format(self.location, self.diameter,self.color)
    

#prints contents of a list
def printList(list_Of_SomeKind):    
    for i in range(10):
        print(list_Of_SomeKind[i])

        
        
#prints contents of a dictionary
def printDict(dict_of_SomeKind):
    for key,value in dict_of_SomeKind.items():
        print(key + " : " + value)

        

#used stackOverFlow to find a general idea for a 
#function using kwargs this one takes in 
#kwargs for applying finish attributes to an object
def finishFunc(**kwargs):
    
    string = "} finish {"
    for key in kwargs:
        string =  string + " " + str(key) + " " + str(kwargs[key])
    string += '} }'
    return string