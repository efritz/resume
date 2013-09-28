%% ------------------------------------------------------------------------
%% Copyright 2012 Eric Fritz (eric@eric-fritz.com).
%% ------------------------------------------------------------------------

\ProvidesClass{fritz-resume}[2012/04/30 resume class]

\LoadClass{article}

%%
%% Required packages

\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{parskip}
\RequirePackage{hyperref}
\RequirePackage[none]{hyphenat}
\RequirePackage[quiet]{fontspec}
\RequirePackage[absolute, overlay]{textpos}
\RequirePackage[math-style=TeX, vargreek-shape=unicode]{unicode-math}
\RequirePackage[left=6.1cm, top=2cm, right=1.5cm, bottom=2.25cm, nohead, nofoot]{geometry}

%%
%% Colors and Fonts

\definecolor{gray}{HTML}{4D4D4D}
\definecolor{white}{HTML}{FFFFFF}
\definecolor{orange}{HTML}{FDA333}
\definecolor{lightgray}{HTML}{999999}

\newfontfamily\bodyfont[Path=fonts/]{OpenSans-Regular.ttf}
\newfontfamily\thinfont[Path=fonts/]{OpenSans-Light.ttf}
\newfontfamily\headingfont[Path=fonts/]{OpenSans-CondBold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=gray, Path=fonts/]{OpenSans-Light.ttf}

%%
%% Page Setup

\pagestyle{empty}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {\LARGE\headingfont\color{gray} #1}
  \par\vspace{\parskip}
}


\renewcommand{\subsection}[1]{
  {\Large\headingfont\color{lightgray} #1}
}

%%
%% Lists

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} rl}
}{
  \end{tabular*}
}

\newcommand{\multilinecell}[2][c]{
  \begin{tabular}[#1]{@{}r@{}}
    #2
  \end{tabular}
}

\newcommand{\entry}[4]{
  \multilinecell[t]{#1} & \parbox[t]{11.8cm}{
    \textbf{#2}\hfill{\footnotesize\addfontfeature{Color=lightgray} #3}\\{\small #4}
    \vspace{\parsep}
  } \\
}

\newcommand{\bulletpoint}[2]{\emph{#1:} #2}

%%
%% Header

\newcommand{\header}[4]{
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=orange, anchor=north, minimum width=\paperwidth, minimum height=3.25cm] (box) at (current page.north){};

    \node[anchor=center] (name) at (box) {
      \fontsize{40pt}{72pt}\color{white}{\thinfont #1}{\bodyfont #2}
    };

    \node[anchor=north] at (name.south) {
      \fontsize{14pt}{24pt}\color{white}{\thinfont #3}
    };
  \end{tikzpicture}
  \vspace{1.25cm}
}

%%
%% Aside

\setlength{\TPVertModule}{1cm}
\setlength{\TPHorizModule}{1cm}

\newcommand{\smlsection}[1]{
  \par\vspace{\baselineskip}
  {\LARGE\headingfont\color{gray} #1}
}

\newenvironment{aside}{
  \let\oldsection\section
  \let\section\smlsection
  \begin{textblock}{3.6}(1.5, 3.4)
  \begin{flushright}
  \obeycr
}{
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}
