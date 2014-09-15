%% ------------------------------------------------------------------------
%% Copyright 2012 Eric Fritz (eric@eric-fritz.com).
%% ------------------------------------------------------------------------

\ProvidesClass{fritz-resume}[2012/04/30 resume class]

\LoadClass{article}

%%
%% Required packages

\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{tabto}
\RequirePackage{xcolor}
\RequirePackage{parskip}
\RequirePackage{minibox}
\RequirePackage{hyperref}
\RequirePackage[none]{hyphenat}
\RequirePackage[quiet]{fontspec}
\RequirePackage[absolute, overlay]{textpos}
\RequirePackage[math-style=TeX, vargreek-shape=unicode]{unicode-math}
\RequirePackage[left=4.6cm, top=2cm, right=1.5cm, bottom=2.25cm, nohead, nofoot]{geometry}

%%
%% Colors and Fonts

\definecolor{gray}{HTML}{4D4D4D}
\definecolor{white}{HTML}{FFFFFF}
\definecolor{orange}{HTML}{FDA333}
\definecolor{lightgray}{HTML}{999999}

\newfontfamily\bodyfont[Path=open-sans/]{OpenSans-Regular.ttf}
\newfontfamily\thinfont[Path=open-sans/]{OpenSans-Light.ttf}
\newfontfamily\headingfont[Path=open-sans/]{OpenSans-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[
  Mapping=tex-text,
  Color=gray,
  Path=open-sans/,
  BoldFont={OpenSans-Bold.ttf}, 
  ItalicFont={OpenSans-LightItalic.ttf},
]{OpenSans-Light.ttf}

%%
%% Page Setup

\pagestyle{empty}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {\LARGE\headingfont\color{orange} #1}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  {\Large\headingfont\color{lightgray} #1}
}

%%
%% Lists

\setlength{\tabcolsep}{6pt}

\newcommand{\multilinecell}[2][c]{
  \begin{tabular}[#1]{@{}r@{}}
    #2
  \end{tabular}
}

\newcommand{\pushmargin}[1]{
  \tabto*{-4cm}
  \begin{minipage}[t]{3.5cm}
    \begin{flushright}
      #1
    \end{flushright}
  \end{minipage}
}

\newcommand{\entry}[4]{
  \textbf{\addfontfeature{Color=gray} #1} \pushmargin{#3}
  \hfill {\footnotesize\addfontfeature{Color=lightgray} #2} \\
  {\small #4}
  \vspace{\parsep}
}

\newcommand{\bulletpoint}[2]{\emph{#1:} #2}

%%
%% Header

\newcommand{\header}[4]{
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=orange, anchor=north, minimum width=\paperwidth, minimum height=1.8cm] (box) at (current page.north){};

    \node[anchor=center] (name) at (box) {
      \fontsize{40pt}{72pt}\color{white}{\thinfont #1 #2}
    };

    \node[anchor=north] at (box.south) {
      \fontsize{14pt}{24pt}\color{orange}{\bodyfont #3}
    };
  \end{tikzpicture}
  \vspace{0.25cm}
}

%%
%% Aside

\setlength{\TPVertModule}{1cm}
\setlength{\TPHorizModule}{1cm}

\newcommand{\smlsection}[1]{
  \par\vspace{\baselineskip}
  {\LARGE\headingfont\color{orange} #1}
}

\newenvironment{aside}{
  \let\oldsection\section
  \let\section\smlsection
  \begin{textblock}{3.5}(.5, 2.45)
    \begin{flushright}
      \obeycr
}{
      \restorecr
    \end{flushright}
  \end{textblock}
  \let\section\oldsection
}
