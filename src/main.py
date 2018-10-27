#!/usr/bin/python

import util
import pdfLoader


outputFolder = "../output/"
datasetFolder = "../dataset/"
templateFolder = datasetFolder + "templates/"
imagsFolder = datasetFolder + "images/"
handwrittenFolder = datasetFolder + "handwritten/"
machinePrintedFolder = datasetFolder + "machinePrinted/"


print("Clean output")
util.cleanupOutput(outputFolder)

print("Loading background template")
page = pdfLoader.getFirstPageOfPDF(templateFolder + "a4-graph-5mm.pdf")
page.save(outputFolder + "/test.jpg", 'JPEG')

print("Finished")
