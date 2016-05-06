
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
import sys
import os
from matplotlib.backends.backend_pdf import PdfPages
from PIL import Image

def imageProcessing(f):
    im=Image.open(f)
    imCrop=im.crop((20,350,575,750))
    basewidth = 300
    wpercent = (basewidth/float(imCrop.size[0]))
    hsize = int((float(imCrop.size[1])*float(wpercent)))
    imCropScaled=imCrop.resize((basewidth,hsize), Image.ANTIALIAS)
    return imCropScaled


with PdfPages('datafit.pdf') as pdf:

  fig=plt.figure()
  fig.set_size_inches([7,10])
  c=1

  for f in os.listdir('./'):

    if f.endswith('.png'):

      im=imageProcessing(f)

      ax=fig.add_subplot(3,2,c)
      ax.imshow(im)
      ax.axis('off')
      ax.set_title(f)
      plt.tight_layout()
      c=c+1

      if c>6:
        pdf.savefig(fig,dpi=1200)
        fig=plt.figure()
        fig.set_size_inches([7,10])
        c=1

pdf.savefig(fig,dpi=1200)
pdf.close()
