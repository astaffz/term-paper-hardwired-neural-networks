# ----------------------------------------------------
# Engine Configuration: Force XeLaTeX for PDF generation
# ----------------------------------------------------
$pdf_mode = 5;
$postscript_mode = 0;
$dvi_mode = 0;

# ----------------------------------------------------
# Directory Configuration: Route all build files to 'build'
# ----------------------------------------------------
$out_dir = 'build';
$aux_dir = 'build';

# ----------------------------------------------------
# Compiler Flags
# ----------------------------------------------------
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Ensure the output directory is searched for dependent files
$search_path_separator = ':';
