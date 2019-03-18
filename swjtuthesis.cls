\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuthesis}

\LoadClass[titlepage, UTF8]{ctexbook}

\RequirePackage{array}
\RequirePackage{zhnumber}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titlesec}
\RequirePackage{scrextend}

\geometry{a4paper,left=2.7cm,right=2.7cm,top=2.6cm,bottom=2.6cm}

% 页眉设置
% 重新定义 plain 格式，包含页眉
\let\oldheadrule\headrule
\renewcommand{\headrule}{\color[gray]{0.55}\oldheadrule}
\renewcommand{\headrulewidth}{1.8pt}
\fancypagestyle{plain}{
    \fancyhead[L]{}
    \fancyhead[C]{\heiti\large\color[gray]{0.55}西南交通大学本科毕业设计（论文）}
    \fancyhead[R]{}
}

% 标题页
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
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
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
    \clearpage\mbox{}\thispagestyle{empty}\clearpage
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
        \rightline{作者签名：\qquad\qquad\qquad\enspace\enspace\qquad\qquad}
    \vspace{\stretch{1}}
        \rightline{日期：\qquad年\qquad月\qquad日\qquad\qquad}
    \vspace{\stretch{3}}
    \thispagestyle{empty}
    \clearpage\mbox{}\thispagestyle{empty}\clearpage
}


% 版权使用授权书

\newcommand{\makecua} {
    \thispagestyle{empty}
    \begin{center}
        {
            \heiti\LARGE
            西南交通大学\\[18bp]
            本科毕业设计（论文）版权使用授权书\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        \songti\zihao{4}
        本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。
    \end{spacing}
    \begin{spacing}{2.3}
        \songti\zihao{4}
        \hspace*{\stretch{7}} \textbf{保密}$\square$，在\rule[-2pt]{1.5cm}{0.3pt}年解密后适用本授权书。 \hspace{\stretch{2}}
        \newline
        \hspace*{\stretch{1}} 本论文属于 \hspace{\stretch{7}}
        \newline
        \hspace*{\stretch{7}} \textbf{不保密}$\square$。\hspace{\stretch{12}}
        \newline
        \hspace*{\stretch{4}}（请在以上方框内打“\checkmark”）\hspace{\stretch{19}}
    \end{spacing}
    \vspace{\stretch{3}}
    \begin{tabular}{l@{\hskip 0.8in}l}
        作者签名：  &   指导老师签名：    \\[40bp]
        日期：\qquad\enspace年\qquad月\qquad日    &   日期：\qquad\enspace年\qquad月\qquad日\\
    \end{tabular}
    \vfill
    \cleardoublepage
}



% 前言部分
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{\@latex@error{No \noexpand\department given}\@ehc}
\newcommand\class[1]{\renewcommand\@class{#1}}
\newcommand\@class{\@latex@error{No \noexpand\class given}\@ehc}
\newcommand\taskstartdate[1]{\renewcommand\@taskstartdate{#1}}
\newcommand\@taskstartdate{\@latex@error{No \noexpand\taskstartdate given}\@ehc}
\newcommand\taskenddate[1]{\renewcommand\@taskenddate {#1}}
\newcommand\@taskenddate{\@latex@error{No \noexpand\taskenddate given}\@ehc}

\newcommand{\underlinebox}[3]{
    \underline{\makebox[#1][#2]{#3}}
}
\newcommand{\makefrontmatter}{
    \pagestyle{plain}
    \fancyfoot[C]{}
    \songti\large
    \quad

    \hskip -1.1cm
    \begin{tabular}{l@{\hskip 0.3in}l}
        院系 \underlinebox{6.2cm}{c}{\@department}    &   专业 \underlinebox{6.2cm}{c}{} \\
        年级 \underlinebox{6.2cm}{c}{\@grade} &   姓名 \underlinebox{6.2cm}{c}{}\\
    \end{tabular}
    \newline\newline\newline
    题目 \underlinebox{14.4cm}{c}{}
    \newline\newline

    \hskip -1.1cm
    \begin{tabular}{l@{\hskip 0.1in}l}
        指导教师            &   \\[6bp]
        评\hspace{24bp}语   &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \multicolumn{1}{r}{指导教师 \underlinebox{4cm}{c}{}(签章)}\\[10bp]
    \end{tabular}
    \newline\newline

    \hskip -1.1cm
    \begin{tabular}{l@{\hskip 0.1in}l}
        评\hspace{6bp}阅\hspace{6bp}人            &   \\[6bp]
        评\hspace{24bp}语   &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \underlinebox{13.6cm}{c}{}\\[10bp]
                            &   \multicolumn{1}{r}{评\hspace{6bp}阅\hspace{6bp}人 \underlinebox{4cm}{c}{}(签章)}\\[10bp]
    \end{tabular}
    \newline\newline
    成\hspace{24bp}绩 \underlinebox{5.5cm}{c}{}\\[12bp]
    答辩委员会主任 \underlinebox{4.25cm}{c}{}(签章)\\[12bp]
    \rightline{年\hspace{20bp}月\hspace{20bp}日}
    \cleardoublepage

    % ------------ 前言部分开始 ------------ %
    \frontmatter
    \pagestyle{plain}
    \pagenumbering{Roman}
    \fancyfoot[C]{\color[gray]{0.55}第 \thepage\ 页}

    % 毕设设计任务书
    \titleformat{\chapter}[display]
        {\centering\heiti\bfseries\zihao{3}}
        {}{}{}
    \titlespacing*{\chapter}{0pt}{-15pt}{16.06pt}
    \chapter{毕业设计（论文）任务书}
    \begin{spacing}{1.7}
        \songti\large
        \noindent班\hspace{24bp}级 \underlinebox{3cm}{c}{\@class}
        学生姓名 \underlinebox{3cm}{c}{\@author}
        学\hspace{24bp}号 \underlinebox{3.5cm}{c}{\@stunum}
        \newline发题日期：\@taskstartdate \hspace{\stretch{20}} 完成日期：\@taskenddate \hspace{\stretch{1}}
        \newline题\hspace{24bp}目 \underlinebox{13.6cm}{c}{\@title}\newline
    \end{spacing}
    \vskip -0.5cm
    \songti\large
    \noindent1、本论文的目的、意义\\
    \begin{spacing}{1}
        \noindent\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
    \end{spacing}
    \vskip 0.3cm
    \noindent2、学生应完成的任务\\
    \begin{spacing}{1}
        \noindent\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
    \end{spacing}
    \clearpage

    \noindent3、本论文与本专业的培养目标达成度如何？（如在知识结构、能力结构、素质结构等方面有哪些有效的训练。）\\
    \begin{spacing}{1}
        \noindent\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
        \newline\underlinebox{16cm}{c}{}
    \end{spacing}

    \noindent4、论文各部分内容及时间分配：（共17周）\\
    \begin{spacing}{1.5}
        \noindent\hspace{18bp}第一部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第二部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第三部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第四部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第五部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}评阅及答辩 \underlinebox{11.5cm}{c}{}(1 周)
        \newline备\hspace{24bp}注\underlinebox{13.7cm}{c}{}
        \newline\underlinebox{15cm}{c}{}
        \newline\newline指导老师：\underlinebox{4cm}{c}{}\hspace{12bp}\@taskstartdate
        \newline\newline审\hspace{6bp}批\hspace{6bp}人：\underlinebox{4cm}{c}{}\hspace{12bp}\@taskenddate
    \end{spacing}
    \ifthispageodd{\cleardoublepage}{\clearpage}

    % 摘要页
    \chapter{摘\hspace{10pt}要}
    \songti\large

}