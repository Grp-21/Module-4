# This Python file uses the following encoding: utf-8
import easygui
import piexif
print("Location Program Running...\n")
#for selecting the file
gps_info = ' '
def sendPath(filePath):
    global gps_info
    exif_dict = piexif.load(filePath)
    thumbnail = exif_dict.pop("thumbnail")
    if thumbnail is not None:
        with open("thumbnail.jpg", "wb+") as f:
            f.write(thumbnail)

    #for printing the whole exif_dict

    gps_info = exif_dict['GPS']
    return(get_loc())
#for converting to decimal from degrees minutes seconds
def get_decimal_from_dms(dms, ref):
    degrees = dms[0][0] / dms[0][1]
    minutes = dms[1][0] / dms[1][1] / 60.0
    seconds = dms[2][0] / dms[2][1] / 3600.0
    if ref in ['S', 'W']:
        degrees = -degrees
        minutes = -minutes
        seconds = -seconds
    return round(degrees + minutes + seconds, 5)
def get_loc():
    global gps_info
    try:
        GPSLatitude = gps_info[2]
        GPSLongitude = gps_info[4]
        Latitude_direction = gps_info[1].decode('utf-8')
        Longitude_direction = gps_info[3].decode('utf-8')
        def get_coordinates():
            lat = get_decimal_from_dms(GPSLatitude,Latitude_direction)
            lon = get_decimal_from_dms(GPSLongitude,Longitude_direction)
            return (lat,lon)
        print("This image was taken at these co-ordinates: " + str(get_coordinates()))
    except KeyError:
        print("This image does not have any location data present. Select another image.")
    return(str(get_coordinates()))
#basic funcitonality done, need more code for handling other image types exceptions
# if __name__ == "__main__":
#     pass
