# This Python file uses the following encoding: utf-8
#pip install haversine
import haversine as hs
from haversine import Unit

# loc1 and loc2 are the two tuple containing geocordinates
# Example
# loc1=(28.426846,77.088834)
# loc2=(28.394231,77.050308)

def DistanceMeters(loc1,loc2):
    return hs.haversine(loc1,loc2,unit=Unit.METERS)

def initialize_var(location, loc_info):
    loc1=eval(location[1:-1])
    loc2=eval(loc_info[1:-2])

    #Function calling example
    eg= DistanceMeters(loc1, loc2)

    print(eg)
    return(eg)


'''
string1 ='(28.426846,77.088834)' # '(64357,28753)'
string2 = '(28.426846,77.088834)' #'(73826,39852)'
initialize_var(string1,string2)
'''
# if __name__ == "__main__":
#     pass
