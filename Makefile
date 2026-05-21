out_dir 	:= Out/
source_dir  := Source/
tex_file 	:= PracaInzynierska.tex 

all: clean make_out_dir compile

compile: 
	cd $(source_dir) && pandoc $(tex_file) -o ../$(out_dir)$(basename $(tex_file)).docx && pdflatex -output-directory=../$(out_dir) $(tex_file) && pdflatex -output-directory=../$(out_dir) $(tex_file)

make_out_dir: clean
	mkdir $(out_dir) 

clean: 
	- rm -r $(out_dir) 2>/dev/null;
	- rm *.{docx,aux,fls,log,out,gz} 2>/dev/null;
	- rm .latexrun.db 2>/dev/null;
	- rm .latexrun.db.lock 2>/dev/null

