TARGET=resume
HTML=main_html
SRC={$TARGET}

default: pdf

both: pdf html

dvi: resume.tex 
#	pygmentize the input source file -- THIS NAME SHOULD BE SAFE
#	pygmentize -f latex -o __resume.tex resume.tex
#	run latex twice to get references correct
	latex resume.tex
#	you can also have a bibtex line here
#	bibtex resume
	latex resume.tex
#	remove the pygmentized output to avoid cluttering up the directory
#	rm __resume.tex

ps: dvi
	dvips -R -Poutline -t letter resume.dvi -o resume.ps

pdf: ps
	ps2pdf resume.ps
