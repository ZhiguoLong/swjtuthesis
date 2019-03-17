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
\RequirePackage{setspace}
\RequirePackage{amssymb}

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

% 学术诚信声明

\newcommand{\makeais} {
    \begin{center}
        {
            \heiti\LARGE
            西南交通大学\\[18bp]
            本科毕业设计（论文）学术诚信声明\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        \songti\zihao{4}
        本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
    \end{spacing}
    \songti\zihao{4}
    \vspace{\stretch{5}}
        \rightline{作者签名：\qquad\qquad\qquad\enspace\enspace}
    \vspace{\stretch{1}}
        \rightline{日期：\qquad年\qquad月\qquad日}
    \vspace{\stretch{3}}
    \clearpage
}
