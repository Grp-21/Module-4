import sys
import platform
from PySide2 import QtCore, QtGui, QtWidgets
from PySide2.QtCore import (QCoreApplication, QPropertyAnimation, QDate, QDateTime,
                            QMetaObject, QObject, QPoint, QRect, QSize, QTime, QUrl, Qt, QEvent)
from PySide2.QtGui import (QBrush, QColor, QConicalGradient, QCursor, QFont, QFontDatabase,
                           QIcon, QKeySequence, QLinearGradient, QPalette, QPainter, QPixmap, QRadialGradient)
from PySide2.QtWidgets import *

# GUI FILE
from ui_splash_screen import Ui_SplashScreen

counter = 0
jumper = 1


class SplashScreen(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        self.ui = Ui_SplashScreen()
        self.ui.setupUi(self)

        self.progressBarValue(0)

        self.setWindowFlag(QtCore.Qt.FramelessWindowHint)
        self.setAttribute(QtCore.Qt.WA_TranslucentBackground)

        self.timer = QtCore.QTimer()
        self.timer.timeout.connect(self.progress)
        # pass 35 for milliseconds below
        self.timer.start(35)
        # SHOW ==> MAIN WINDOW
        ########################################################################
        self.show()

    ## ==> END ##
    def progress(self):
        global counter
        value = counter
        global jumper

        # HTML TEXT PERCENTAGE
        htmlText = """<p><span style=" font-size:68pt;">{VALUE}</span><span style=" font-size:58pt; vertical-align:super;">%</span></p>"""

        # REPLACE VALUE
        newHtml = htmlText.replace("{VALUE}", str(jumper))
        if(value > jumper):
            # APPLY NEW PERCENTAGE TEXT
            self.ui.labelPercentage.setText(newHtml)
            jumper += 1

        if value >= 100:
            value = 1.000
        self.progressBarValue(value)

        if counter > 100:
            self.timer.stop()

            self.close()
        counter += 1

    def progressBarValue(self, value):
        # ProgressBar Style Sheet
        styleSheet = """QFrame{
            border-radius: 150px;
            background-color: qconicalgradient(cx: 0.5, cy: 0.5, angle: 90, stop: {STOP_1} rgba(255, 0, 127, 0), stop: {STOP_2} rgba(85, 170, 255, 255));
        }"""
        progress = (100 - value) / 100.0

        STOP_1 = str(progress - 0.001)
        STOP_2 = str(progress)

        newStylesheet = styleSheet.replace(
            "{STOP_1}", STOP_1).replace("{STOP_2}", STOP_2)
        self.ui.circularProgress.setStyleSheet(newStylesheet)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = SplashScreen()
    sys.exit(app.exec_())
