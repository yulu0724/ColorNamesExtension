## 
Example code on Extened color naming as described in:
Beyond Eleven Color Names for Image Understanding
Lu Yu · Lichao Zhang · Joost van de Weijer · Fahad Shahbaz Khan · Yongmei Cheng · C. Alejandro Parraga.
Machine Vision and Application 2017.

##
Run the example_color_naming.m demo for an exmample of color naming image pixels. The programm calls the im2cLAB2_test function which annotates image pixels with color names. The mapping from LAB values to color names (w2c11/25/39.mat) which have been learned from Google images (2500) and their correspoding orders (cn11/25/39.txt) are provided in 'mapping_matrices' folder. The function takes a color image as input and returns the probability for 11/25/39 color names for all pixels in the image. 


