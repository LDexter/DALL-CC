# DALL-CC

###### DALL-E in ComputerCraft for AI image generation

### AI Image Generation and CC Image Rendering

Generates locally-saved png files, converts to local bimg files (both replaced upon each re-run), and renders the results on-screen. Conversion and rendering are made possible through my fork of [9551-Dev's Fork](https://github.com/9551-Dev/pngLua) of the [original pngLua library](https://github.com/DelusionalLogic/pngLua).

### Optional DavinCC Integration

**_Works seamlessly with [DavinCC](https://github.com/LDexter/DavinCC)_** to produce AI-generated images, that are prompted by AI-generated text. This requires as little effort as: _"Imagine a photograph/artwork/cartoon of a bird. Describe."_. The value achieved here is immese, as your input consists of two key words: "artwork" + "bird", while DavinCC's output is a verbose breakdown of your bird in great artistic detail... and DALL-CC **_loves detail_**. An example output from this incredible AI tag-team effort is linked below.

#### DALL-vinci Output Sample

![DALL-vinci output](https://github.com/LDexter/fontawesome/blob/main/DavinCC/DALLvinci.png)

## Setup Guide

1. Ensure you have Git 1.6.5 or later in your PC's terminal: `git --version`
2. Run `git clone --recursive https://github.com/LDexter/DALL-CC.git` in CC **_root directory_**
3. Follow these steps for connecting your OpenAI account (free to use):
   1. Sign-in and access your [private API key](https://beta.openai.com/account/api-keys)
   2. Paste the API key into `template.env`, replacing the sample key
   3. Rename template.env to just .env
4. Run `img [number] [magnitude](sm, md, lg)` and enjoy!

All image links will be written to `/data/out.txt`.
