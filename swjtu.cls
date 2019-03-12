\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuthesis}

\LoadClass[titlepage, UTF8]{ctexart}

\newcommand\grade[1]{\renewcommand\@grade{#1}}
\newcommand\@grade{\@latex@error{No \noexpand\grade given}\@ehc}
\newcommand\stunum[1]{\renewcommand\@stunum{#1}}
\newcommand\@stunum{\@latex@error{No \noexpand\stunum given}\@ehc}
\renewcommand\author[1]{\renewcommand\@author{#1}}
\renewcommand\@author{\@latex@error{No \noexpand\author given}\@ehc}
\newcommand\major[1]{\renewcommand\@major{#1}}
\newcommand\@major{\@latex@error{No \noexpand\major given}\@ehc}
\newcommand\instructor[1]{\renewcommand\@instructor{#1}}
\newcommand\@instructor{\@latex@error{No \noexpand\instructor given}\@ehc}

\RequirePackage{array}
\RequirePackage{zhnumber}
\RequirePackage{geometry}

\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\geometry{a4paper,left=2.7cm,right=2.7cm,top=2.6cm,bottom=2.6cm}


\newcommand{\maketitlepage}{
    \heiti
    \begin{titlepage}
    \vspace*{\stretch{1}}
    \begin{center}
        {
            \LARGE\ctexset{space=true}
            西 南 交 通 大 学\\[18bp] % CTeX小二字号大小
            本科毕业设计（论文）\\[18bp]
        }
        \vfill
        % 论文题目
        {
            \huge
            \begin{tabular}{C{12cm}}
                \@title
            \end{tabular}
        } \\
        \vspace{\stretch{3}}
        % 个人信息
        {
            \large
            \begin{tabular}{ll}
                年\hspace{24bp}级： &   \underline{\@grade}   \\[12bp]
                学\hspace{24bp}号： &   \underline{\@stunum}  \\[12bp]
                姓\hspace{24bp}名： &   \underline{\@author}  \\[12bp]
                专\hspace{24bp}业： &   \underline{\@major}   \\[12bp] 
                指导老师：  &   \underline{\@instructor}    \\[12bp]
            \end{tabular}

        }
        \vspace{\stretch{2}}
        % 当前日期
        {
            \large
            \zhdigits *{\the\year}年\zhdigits *{\the\month}月
        }
    \end{center}
    \vfill
    \end{titlepage}
}

