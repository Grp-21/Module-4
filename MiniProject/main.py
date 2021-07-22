# This Python file uses the following encoding: utf-8
import sys
import os
import datetime
from ImagePrediction import *
from get_loc import *
from location_verify import *

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl

classFound = ' '
confiFound = 0
location = ' '
percen = 0


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        # QTimer - Run Timer
        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.setTime())
        self.timer.start(1000)

    # Signal Send Text
    sendText = Signal(str)
    # Signal Set Name
    setName = Signal(str)

    # Signal Set Data
    printTime = Signal(str)

    # Signal Visible
    isVisible = Signal(bool)


    # Signal setClass
    setClass = Signal(str)

    # Signal setConfidence
    setConfidence = Signal(int)

    # Signal setConfidence
    setLocPercen = Signal(int)


    # Show / Hide Rectangle
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        print("Is rectangle visible: ", isChecked)
        self.isVisible.emit(isChecked)

    # Set Timer Function
    def setTime(self):
        global confiFound
        global classFound
        global percen
        now = datetime.datetime.now()
        formatDate = now.strftime("Now is %H:%M:%S %p of %Y/%m/%d")
        self.setClass.emit('Probability of Alteration  : ' + classFound)
        self.printTime.emit(formatDate)
        self.setConfidence.emit(confiFound)
        self.setLocPercen.emit(percen)
    # Function Set Name To Label
    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)

    @Slot(str)
    def get_image_path(self, filePath):
        global classFound
        global confiFound
        global location
        location = sendPath(filePath[8:])
        classFound,confiFound = get_image(filePath[8:])


    @Slot(str)
    def fileName(self, filePath):
       file = open(QUrl(filePath).toLocalFile(), "r")
       global location
       global percen
       loc_info = file.read()
       result_loc=initialize_var(location,loc_info)
       round(result_loc)
       #Here try to implement -> the bigger the difference the smaller the percentage
       #the smaller the distance the bigger the percentage
       if result_loc<1000:
           percen = 100
       else:
           percen = 100-(result_loc/100)
       if percen < 0:
           percen = 0
       print(loc_info)
       file.close()



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # Set App Extra Info
    app.setOrganizationName("Image Verifier with Location")
    app.setOrganizationDomain("N/A")

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml/nimi.qml"))



    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
