%% ------------------------------------------------------------------------
%% Copyright 2023 Eric Fritz (eric@eric-fritz.com).
%% ------------------------------------------------------------------------

\ProvidesClass{clean-resume}[2023/11/24 resume class]

\LoadClass{article}

%
% Spacing Definitions

\newcommand{\guttersize}{4cm}
\newcommand{\gutterpadding}{.5cm}
\newcommand{\headerheight}{2cm}
\newcommand{\headermargin}{0.25cm}

%
% Derived Spacing

\newcommand{\ledge}{\dimexpr-\guttersize+\gutterpadding}
\newcommand{\gsize}{\dimexpr\guttersize-\gutterpadding*2}
\newcommand{\msize}{\dimexpr\paperwidth-\gutterpadding*2}

%
% Imports

\RequirePackage{tikz}
\RequirePackage{tabto}
\RequirePackage{array}
\RequirePackage{bbding}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{parskip}
\RequirePackage{hyperref}
\RequirePackage{hycolor}
\RequirePackage{enumitem}
\RequirePackage{scrextend}
\RequirePackage[quiet]{fontspec}

\RequirePackage[
  left=\guttersize,
  right=1.5cm,
  top=\headerheight,
  bottom=2cm,
  nohead,
  nofoot,
]{geometry}

%
% Colors and Fonts

\definecolor{white}{HTML}{FFFFFF}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{888888}
\definecolor{header}{HTML}{4C98B2}

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
]{OpenSans-Regular.ttf}

%
% Header Font Sizes

\newcommand{\asize}{40pt}
\newcommand{\bsize}{16pt}
\newcommand{\csize}{10pt}

%
% Basic Layout Overrides

\pagestyle{empty}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {\LARGE\headingfont\color{header} #1}
}

%
% Header

\newcommand{\headertext}[3]{
  \fontsize{#2}{#2}\color{#3}{\thinfont #1}
}

\newcommand{\header}[3]{
  \begin{tikzpicture}[remember picture, overlay]
    \tikzset{every node/.style={
      minimum width=\paperwidth
    }}

    \node[
      rectangle,
      fill=header,
      anchor=north,
      minimum height=\headerheight,
    ] (box) at (current page.north) {};

    \node[anchor=north, yshift=-1em] (a) at (box.north) {
      \headertext{#1}{\asize}{white}
      \headertext{(#2)}{\bsize}{white}
    };
    \node[anchor=north] (c) at (box.south) {
      \headertext{#3}{\csize}{header}
    };
  \end{tikzpicture}
  %
  \vspace{\headermargin}
}

%
% Content Commands

\newcommand{\detailentry}[5]{
  \textbf{#1} \gutter{\datefont{#3}} \\
  {\thinfont\small #2} \hfill \soft{#4}
  \ifthenelse{\equal{#5}{}}{}{\\ #5}
}

\newcommand{\lineentry}[3]{
  #1 \gutter{\datefont{#3}} \hfill \soft{#2}
}

%
% Text styles

\newcommand{\soft}[1]{{\footnotesize\muted{#1}}}
\newcommand{\datefont}[1]{{\thinfont\muted{#1}}}
\newcommand{\muted}[1]{{\addfontfeature{Color=lightgray} #1}}

%
% Link styles

\hypersetup{
  colorlinks=true,
  urlcolor=[rgb]{0.298,0.596,0.698}, % mimmics header color
}

%
% Internal Commands

\newcommand{\gutter}[1]{
  \tabto*{\ledge}
  \begin{minipage}[t][\parskip][t]{\gsize}
    \begin{flushright}
      #1
    \end{flushright}
  \end{minipage}
}
