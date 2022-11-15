'''
Image processing class with few methods and some filters.
'''

import math
from PIL import Image, ImageFilter

class ImageProcessing:
    # Init methods
    def __init__(self, w, h):
        # Initialise an empty image (w, h)
        self.name = "empty.jpg"
        self.w, self.h = w, h
        self.image = Image.new("RGB", (self.w, self.h))

    def __init__(self, name):
        # Initialise with a named image
        self.name = name
        self.image = Image.open(self.name)
        self.w, self.h = self.image.width, self.image.height

    # ---------- LOW LEVEL PROCESSING ----------
    def invert(self):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))

                # Proxess r, g, b to newR, newG, newB
                newR = 255-r
                newG = 255-g
                newB = 255-b

                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (newR, newG, newB))
        return newImage

    def greenColor(self):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))
                
                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (r, 0, b))
        return newImage

    def redColor(self):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))
                
                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (0, g, b))
        return newImage

    def blueColor(self):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))           
                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (r, g, 0))
        return newImage
    
    def scale(self, scaleR, scaleG, scaleB):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))

                # Process r, g, b to newR, newG, newB
                newR = int(r * scaleR)
                newG = int(g * scaleG)
                newB = int(b * scaleB)

                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (newR, newG, newB))
        return newImage

    def posterize(self, size):
        # Make an empty image
        newImage = Image.new("RGB", (self.w, self.h))

        # Traverse self.image
        for i in range(self.w):
            for j in range(self.h):
                # Extract r, g, b
                r, g, b = self.image.getpixel((i, j))

                # Proxess r, g, b to newR, newG, newB
                newR = r - r%size
                newG = g - g%size
                newB = b - b%size

                # Place newR, newG, newB in new image
                newImage.putpixel((i, j), (newR, newG, newB))
        return newImage
    
    # ---------- IMAGE FILTERING ----------
    def emboss(self):
        return self.image.filter(ImageFilter.EMBOSS)

    def blur(self, radius):
        return self.image.filter(ImageFilter.GaussianFilter(radius))



    
