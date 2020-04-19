# simple-scripts
A collection of simple but useful Bash scripts so I don't have to remember the commands. Most scripts deal with `.pdf` or video file manipulation/conversion.
# List of Scripts
* `avcomb.sh`
    * Combine the audio stream of video 1 with the video stream of video 2.
    * Requires `ffmpeg`.
* `djvu2pdf.sh`
    * Convert `.djvu` to `.pdf`.
    * Requires `ddjvu`.
* `pdf2png2pdf.sh`
    * Convert `.pdf` to `.png` and then back to `.pdf`.
    * Useful for deactivating links in the `.pdf`.
    * Requires `convert` from `imagemagick`.
* `pdfcombine.sh`
    * Combine multiple `.pdf` files into a single `.pdf`.
    * Requires `pdftk`.
* `upgrade.sh`
    * Fetch and update packages; then remove old packages.
    * Uses `apt-get` package manager.
* `vid2avi.sh`
    * Convert a compatible video container file to `.avi` while trying to maintain good quality.
    * Requires `ffmpeg`.
