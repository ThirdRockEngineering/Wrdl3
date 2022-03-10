from PIL import Image, ImageDraw, ImageFont


def getSize(txt, font):
    img = Image.new('RGB', (200, 100))
    d = ImageDraw.Draw(img)
    return d.textsize(txt, font)
    # return d.text((20, 20), 'Hello', fill=(255, 0, 0))

    # testImg = Image.new('RGB', (1, 1))
    # testDraw = ImageDraw.Draw(testImg)
    # return testDraw.textsize(txt, font)


if __name__ == '__main__':

    fontname = "Arial.ttf"
    fontsize = 11
    text = "example@gmail.com"

    colorText = "black"
    colorOutline = "red"
    colorBackground = "white"

    font = ImageFont.truetype(fontname, fontsize)
    width, height = getSize(text, font)
    img = Image.new('RGB', (width+4, height+4), colorBackground)
    d = ImageDraw.Draw(img)
    d.text((2, height/2), text, fill=colorText, font=font)
    d.rectangle((0, 0, width+3, height+3), outline=colorOutline)

    img.save("./image.png")
