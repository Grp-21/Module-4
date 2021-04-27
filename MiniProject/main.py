# This Python file uses the following encoding: utf-8
import sys
import os
import datetime

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl

i =0

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

    # Signal readProgress
    readProgress = Signal(int)

    # Text String
    textField = ""

    # Open File
    @Slot(str)
    def openFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
        text = file.read()
        file.close()
        print(text)
        self.readText.emit(str(text))

    # Read Text
    @Slot(str)
    def getTextField(self, text):
        self.textField = text

    # Write File
    @Slot(str)
    def writeFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), "w")
        file.write(self.textField)
        file.close()
        print(self.textField)

    # Show / Hide Rectangle
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        print("Is rectangle visible: ", isChecked)
        self.isVisible.emit(isChecked)

    # Set Timer Function
    def setTime(self):
        global i
        now = datetime.datetime.now()
        formatDate = now.strftime("Now is %H:%M:%S %p of %Y/%m/%d")
        #print(formatDate)
        self.printTime.emit(formatDate)
        self.readProgress.emit(i+1)
        i=i+1

    # Function Set Name To Label
    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)

    @Slot(str)
    def fileName(self, filePath):
       file = open(QUrl(filePath).toLocalFile(), "r")

       locInfo = file.read()
       print(locInfo)
       file.close()

'''
    def progress(self):
        for i in range(value,101):
            self.readProgress.emit(i)

'''




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
