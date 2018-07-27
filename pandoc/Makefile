
OBJNAME=${obj}
BEAMEROBJ=${OBJNAME}_beamer
THEME=simple
BRROWSER=google-chrome --new-window
#THEMES
#Black (default) - White - League - Sky - Beige - Simple
TRANSITION=fade
#TRANSITION:
#None - Fade - Slide - Convex - Concave - Zoom
#BRROWSER=firefox
PANDOCOPT=\
		  --slide-level=2\
		  --mathjax\

#PDFMAINFONT="Times New Roman"
PDFMAINFONT="SimSun"
PDFENGINE=lualatex

#Serif - Blood - Night - Moon - Solarized  //No capital
#black: Black background, white text, blue links (default theme) //capital
#white: White background, black text, blue links // capital
#league: Gray background, white text, blue links (default theme for reveal.js < 3.0.0)// capital
#beige: Beige background, dark text, brown links // capital
#sky: Blue background, thin dark text, blue links //capital
#night: Black background, thick white text, orange links // capital
#simple: White background, black text, blue links // No capital, okay
#solarized: Cream-colored background, dark green text, blue links // capital

.PHONY:release clean

all:slides
	${BRROWSER}  ${OBJNAME}.html

slides:
	pandoc ${OBJNAME}.md -o ${OBJNAME}.html -t revealjs -s -V theme=${THEME} -V transition=${TRANSITION} ${PANDOCOPT}

self:
	pandoc ${OBJNAME}.md -o ${OBJNAME}.html -t revealjs -s --self-contained  -V theme=${THEME} -V transition=${TRANSITION} ${PANDOCOPT}

beamer:
	pandoc ${OBJNAME}.md -o ${BEAMEROBJ}.pdf -t beamer -s --pdf-engine=${PDFENGINE} -V mainfont=${PDFMAINFONT} ${PANDOCOPT}

viewbeamer:beamer
	evince ${BEAMEROBJ}.pdf

pdf:
	pandoc ${OBJNAME}.md -o ${OBJNAME}.pdf -s --pdf-engine=${PDFENGINE} -V mainfont=${PDFMAINFONT} ${PANDOCOPT}

pptx:
	pandoc ${OBJNAME}.md -o ${OBJNAME}.pptx ${PANDOCOPT}

tex:
	pandoc ${OBJNAME}.md -s -o ${OBJNAME}.tex ${PANDOCOPT}
	sed -i '6i\\\usepackage{ctex}' ${OBJNAME}.tex
	xclip -i ${OBJNAME}.tex
	xelatex ${OBJNAME}.tex
	rm ${OBJNAME}.aux
	rm ${OBJNAME}.tex
	rm ${OBJNAME}.log
	rm ${OBJNAME}.out
	evince ${OBJNAME}.pdf

docx:
	pandoc ${OBJNAME}.md -s -o ${OBJNAME}.docx ${PANDOCOPT}

release:self beamer ppt

clean:
	rm ${OBJNAME}.html
	rm ${OBJNAME}.tex
	rm ${OBJNAME}.pdf
	rm ${OBJNAME}.pptx
	rm ${OBJNAME}.docx

#chromepdf:self
	#cp ${OBJNAME}.html ~/software/reveal.js/index.html
	#curdir=$(pwd)
	#cd ~/software/reveal.js/
	#npm start
	#cd ${curdir}

