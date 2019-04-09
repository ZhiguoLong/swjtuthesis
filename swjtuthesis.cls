\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuthesis}

\LoadClass[UTF8,openany,zihao=-4]{ctexbook}

\RequirePackage{array}
\RequirePackage{zhnumber}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{scrextend}
\RequirePackage{titletoc}
\RequirePackage{ifplatform}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage[backend=biber, sorting=none, maxnames=99,
                style=gb7714-2015, gbnamefmt=lowercase,
                gbpub=false, gbfieldtype=true, gbpunctin=false]
                {biblatex}

% 定义参考文献类型字段
\DefineBibliographyStrings{english}{in={}}
\DefineBibliographyStrings{english}{incn={}}
\DefineBibliographyStrings{english}{mathesis={Master Thesis}}
\DefineBibliographyStrings{english}{phdthesis={Doctor Thesis}}
\DefineBibliographyStrings{english}{mathesiscn={硕士论文}}
\DefineBibliographyStrings{english}{phdthesiscn={博士论文}}

\ifwindows
    \setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold]{SimSun}
    \setCJKmainfont{SimSun}
\fi
\setmainfont{Times New Roman}
\setsansfont{Arial}
\newfontfamily\arial{Arial}
\newfontfamily\timesnewroman{Times New Roman}

\geometry{a4paper,left=2.7cm,right=2.7cm,top=2.6cm,bottom=2.6cm}

% 页眉设置
% 重新定义 plain 格式，包含页眉
\let\oldheadrule\headrule
\renewcommand{\headrule}{\color[gray]{0.55}\oldheadrule}
\renewcommand{\headrulewidth}{1.8pt}
\fancypagestyle{plain}{
    \fancyhead[L]{}
    \fancyhead[C]{\heiti\color[gray]{0.55}西南交通大学本科毕业设计（论文）}
    \fancyhead[R]{}
}

% 重新定义目录名
\renewcommand{\contentsname}{\heiti\Large 目\hspace{10bp}录}
\titlecontents{chapter}
    [3.8em]{\vspace{0.5em}}
    {\heiti\contentslabel{3.5em}}
    {\heiti\hspace*{-3.5em}}
    {\titlerule*[0.3pc]{.}\contentspage}
    [\vspace{0.5em}]

\titlecontents{section}
    [3.8em]{}
    {\songti\contentslabel{1.5em}}
    {\hspace*{-2.3em}}
    {\titlerule*[0.3pc]{.}\contentspage}

\titlecontents{subsection}
    [6.2em]{}
    {\songti\contentslabel{2.3em}}
    {\hspace*{-2.3em}}
    {\titlerule*[0.3pc]{.}\contentspage}

% 设置章节格式
\setcounter{secnumdepth}{3}
\ctexset{
    chapter = {
        format = \centering\heiti\Large,
        name = {第,章},
        number = \thechapter,
        aftername = \enspace,
        beforeskip = -15bp,
        afterskip = 20bp
    },
    section = {
        format = \heiti\large,
        numberformat = \arial\large,
        aftername = \hspace{4bp},
        indent = 0pt
    },
    subsection = {
        format = \heiti\zihao{4},
        numberformat = \timesnewroman\zihao{4},
        aftername = \hspace{4bp},
        indent = 0pt
    },
    subsubsection = {
        format = \heiti,
        numbering = true,
        numberformat = \timesnewroman,
        aftername = \hspace{4bp}
    }
}

% 重定义上标引用使得含有方括号
\DeclareCiteCommand{\supercite}[\mkbibsuperscript]
    {\usebibmacro{cite:init}%
        \let\multicitedelim=\supercitedelim
        \iffieldundef{prenote}
            {}
            {\BibliographyWarning{Ignoring prenote argument}}%
        \iffieldundef{postnote}
            {}
            {\BibliographyWarning{Ignoring postnote argument}}%
    \bibopenbracket}%
    {\usebibmacro{citeindex}%
     \usebibmacro{cite:comp}}
    {}
    {\usebibmacro{cite:dump}\bibclosebracket}

% 定义图表名格式
\captionsetup{
    labelsep = space,
    font = small
}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 表格元素间距
\setlength{\tabcolsep}{18pt}
\renewcommand{\arraystretch}{1.5}

% 公式编号格式
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

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
    \begin{titlepage}
    \vspace*{\stretch{1}}
    \begin{center}
        {
            \heiti\Large\ctexset{space=true}
            西 南 交 通 大 学\\[18bp]
            本科毕业设计（论文）\\[18bp]
        }
        \vfill
        % 论文题目
        {
            \heiti\LARGE
            \begin{tabular}{C{12cm}}
                \@title
            \end{tabular}
        } \\
        \vspace{\stretch{3}}
        % 个人信息
        {
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
            \heiti\Large
            西南交通大学\\[18bp]
            本科毕业设计（论文）学术诚信声明\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        {
            \songti\zihao{4} 
            本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
        }
    \end{spacing}
    \vspace{\stretch{5}}
        \rightline{\songti\zihao{4}作者签名：\hspace{156bp}}
    \vspace{\stretch{1}}
        \rightline{\songti\zihao{4}日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日\hspace{60bp}}
    \vspace{\stretch{3}}
    \thispagestyle{empty}
    \clearpage\mbox{}\thispagestyle{empty}\clearpage
}


% 版权使用授权书

\newcommand{\makecua} {
    \thispagestyle{empty}
    \begin{center}
        {
            \heiti\Large
            西南交通大学\\[18bp]
            本科毕业设计（论文）版权使用授权书\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        {
            \zihao{4}
            本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。
        }
    \end{spacing}
    \begin{spacing}{2.3}
        {
            \zihao{4}
            \hspace*{\stretch{7}} \textbf{保密}$\square$，在\rule[-2pt]{1.5cm}{0.3pt}年解密后适用本授权书。 \hspace{\stretch{2}}
            \newline
            \hspace*{\stretch{1}} 本论文属于 \hspace{\stretch{7}}
            \newline
            \hspace*{\stretch{7}} \textbf{不保密}$\square$。\hspace{\stretch{12}}
            \newline
            \hspace*{\stretch{4}}（请在以上方框内打“\checkmark”）\hspace{\stretch{19}}
        }
    \end{spacing}
    \vspace{\stretch{3}}
    \begingroup
    \zihao{4}
    \begin{tabular}{l@{\hskip 0.8in}l}
        作者签名：  &   指导老师签名：    \\[40bp]
        日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日 &   日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日\\
    \end{tabular}
    \endgroup
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
\newcommand\abstract[1]{\renewcommand\@abstract {#1}}
\newcommand\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\newcommand\keywords[1]{\renewcommand\@keywords {#1}}
\newcommand\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}
\newcommand\enabstract[1]{\renewcommand\@enabstract {#1}}
\newcommand\@enabstract{\@latex@error{No \noexpand\enabstract given}\@ehc}
\newcommand\enkeywords[1]{\renewcommand\@enkeywords {#1}}
\newcommand\@enkeywords{\@latex@error{No \noexpand\enkeywords given}\@ehc}

\newcommand{\underlinebox}[3]{
    \underline{\makebox[#1][#2]{#3}}
}
\newcommand{\makefrontmatter}{
    \pagestyle{plain}
    \fancyfoot[C]{}
    \null

    \hskip -1.05cm
    \begin{tabular}{l@{\hskip 0.3in}l}
        院系 \underlinebox{6.2cm}{c}{\@department}    &   专业 \underlinebox{6.2cm}{c}{} \\
        年级 \underlinebox{6.2cm}{c}{\@grade} &   姓名 \underlinebox{6.2cm}{c}{}\\
    \end{tabular}
    \newline\newline
    题目 \underlinebox{14.4cm}{c}{}
    \newline

    \hskip -1.05cm
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

    \hskip -1.05cm
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
    \newline\newline\newline
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
    {
        \mbox{}\\
        \heiti\zihao{3}\bfseries
        \centerline{毕业设计（论文）任务书}
    }
    \begin{spacing}{1.7}
        \noindent 班\hspace{24bp}级 \underlinebox{3cm}{c}{\@class}
        学生姓名 \underlinebox{3cm}{c}{\@author}
        学\hspace{24bp}号 \underlinebox{3.5cm}{c}{\@stunum}
        \newline 发题日期：\@taskstartdate \hspace{\stretch{20}} 完成日期：\@taskenddate \hspace{\stretch{1}}
        \newline 题\hspace{24bp}目 \underlinebox{13.6cm}{c}{\@title}\newline
    \end{spacing}
    \vskip -0.5cm
    \noindent 1、本论文的目的、意义\\
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
    \noindent 2、学生应完成的任务\\
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
    \clearpage

    \noindent 3、本论文与本专业的培养目标达成度如何？（如在知识结构、能力结构、素质结构等方面有哪些有效的训练。）\\
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

    \noindent 4、论文各部分内容及时间分配：（共17周）\\
    \begin{spacing}{1.5}
        \noindent\hspace{18bp}第一部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第二部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第三部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第四部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}第五部分 \underlinebox{12cm}{c}{}(  周)
        \newline\hspace*{18bp}评阅及答辩 \underlinebox{11.5cm}{c}{}(1 周)
        \newline 备\hspace{24bp}注\underlinebox{13.7cm}{c}{}
        \newline\underlinebox{15cm}{c}{}
        \newline\newline 指导老师：\underlinebox{4cm}{c}{}\hspace{12bp}\@taskstartdate
        \newline\newline 审\hspace{6bp}批\hspace{6bp}人：\underlinebox{4cm}{c}{}\hspace{12bp}\@taskenddate
    \end{spacing}
    \ifthispageodd{\cleardoublepage}{\clearpage}

    % 摘要
    {
        \mbox{}\newline
        \centerline{\heiti\Large 摘\hspace{6bp}要}
        \mbox{}\newline
    }
    \hspace*{24bp}\@abstract\\
    \par
    \noindent {\heiti 关键词：}\@keywords
    \clearpage

    % 英文摘要
    {
        \mbox{}\newline
        \centerline{\heiti\Large Abstract}
        \mbox{}\newline
    }
    \hspace*{24bp}\@enabstract\\
    \par
    \noindent {\bfseries Keywords:}\@enkeywords
    \clearpage

    \tableofcontents
    \clearpage
    \pagenumbering{arabic}
    \mainmatter
}

\newcommand{\makebackmatter}{%
    \backmatter
    \printbibliography[title=参考文献, heading=bibintoc]
}
