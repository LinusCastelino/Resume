\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
% \NeedsTeXFormat{LaTeX2e}

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\RequirePackage{fontawesome}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}


% \renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation


\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{14cm} % Top margin


\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%

% 	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{25pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}

\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvwebsite}[1]{\renewcommand{\cvwebsite}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\Education}[1]{\renewcommand{\Education}{#1}}
\newcommand{\workexp}[1]{\renewcommand{\workexp}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}


\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
  		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)

		{\Large\color{black!80}\cvjobtitle}\\

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}
 		\begin{tabular}{p{0.5cm}@{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Info}} & \cvdate\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\cvmail}{\cvmail}}\\
			\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\Letter}} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvwebsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \href{https://www.\cvwebsite}{\cvwebsite}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}} & \href{https://www.\cvlinkedin}{\cvlinkedin}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\Large\icon{\faGithub}} & \href{https://\cvgithub}{\cvgithub}\\}
		\end{tabular}
		
		\ifthenelse{\equal{\workexp}{}}{}{
			\profilesection{Work Experience}
			\begin{flushleft}
				\workexp
			\end{flushleft}
		}
		
		\ifthenelse{\equal{\Education}{}}{}{
			\profilesection{Education}
			\begin{flushleft}
				\Education
			\end{flushleft}
		}
			
	\end{textblock}
}

\renewcommand{\section}[1]{
	{
		\color{gray}
		\Large\sectioncolor{#1}
	}
}


\setlength{\tabcolsep}{0pt}

\newenvironment{twenty}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{
	#1&\parbox[t]{0.83\textwidth}{
		\textbf{#2}
		\hfill
		{\footnotesize#3}\\
		#4\vspace{\parsep}
	}\\
}

\newcommand{\project}[7]{
	\parbox[t]{\textwidth}{
		\textbf{#1}
		\hfill
		#2\\
		\textbf{\normalsize{Organization:}} #3\\
		\textbf{\normalsize{Role:}} #4\\
		\textbf{\normalsize{Description:}} #5
		\ifthenelse{\equal{#6}{}}{}{\\ \textbf{\normalsize{Notable Contributions: }}{#6}}
		\ifthenelse{\equal{#7}{}}{}{\\ \textbf{\normalsize{Project link:}} \href{#7}{#7}} 
		\vspace{3mm}
	}\\
}

\newcommand{\award}[3]{%
	\parbox[t]{\textwidth}{%
		\textbf{#1}%
		\hfill%
		#2\\%
		#3\vspace{\parsep}%
	}\\
}

\setlength{\tabcolsep}{0pt}

\RequirePackage[left=7.5cm,top=0.9cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}