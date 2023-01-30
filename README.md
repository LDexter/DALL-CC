# DALL-CC

###### DALL-E in ComputerCraft for AI image generation

### Optional DavinCC Integration

**_Works seamlessly with [DavinCC](https://github.com/LDexter/DavinCC)_** to produce AI-generated images, that are prompted by AI-generated text. This requires as little effort as: _"Imagine a photograph/artwork/cartoon of a giraffe. Describe."_ The value achieved here is immese, as your input consists of one word: "giraffe", while DavinCC's output is a verbose breakdown of your giraffe in great detail... and DALL-CC **_loves detail_**. An example output from this incredible AI tag-team effort is linked below.

#### DALL-vinci Output Sample

![DALL-vinci output](https://github.com/LDexter/fontawesome/blob/main/DavinCC/DALLvinci.png)

## Setup Guide

1. Download zip under "< > Code" dropdown and place extracted folder in CC **_root directory_**
2. Follow these steps for API setup from my [openai-lua repository](https://github.com/LDexter/openai-lua#api-setup)
   1. Sign-in and access your [private API key](https://beta.openai.com/account/api-keys)
   2. Paste the API key into `template.env`, replacing the sample key
   3. Rename template.env to just .env
3. Run `img [number] [magnitude](sm, md, lg)` and enjoy!

All image links will be written to `out.txt`.
