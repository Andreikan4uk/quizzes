class QuizQuestion {
  final String question;
  final String answer;
  final List<String> options;
  String userAnswer;

  QuizQuestion({
    required this.question,
    required this.answer,
    required this.options,
    this.userAnswer = '',
  });
}

List<QuizQuestion> questions_1 = [
  QuizQuestion(
    question: 'What are investments?',
    answer:
        'Investing money in securities or real estate with the aim of making a profit',
    options: [
      'Buying stocks on the stock exchange',
      'Investing money in securities or real estate with the aim of making a profit',
      'Starting your own business',
      'Signing a contract with a bank to obtain a loan'
    ],
  ),
  QuizQuestion(
    question: 'What is investment risk?',
    answer: 'The possibility of losing part or all of the investment amount',
    options: [
      'The possibility of losing part or all of the investment amount',
      'Guaranteed profit from investments',
      'The ability to invest a large sum of money',
      'The opportunity to quickly sell investments at a higher price'
    ],
  ),
  QuizQuestion(
    question: 'What is portfolio diversification?',
    answer: 'Allocating investments among various assets to reduce risk',
    options: [
      'Investing all money in one stock',
      'Allocating investments among various assets to reduce risk',
      'Selling all stocks in the portfolio',
      'Using credit for investment',
    ],
  ),
  QuizQuestion(
    question: 'What is investment yield?',
    answer: 'The amount of money that can be obtained when selling investments',
    options: [
      'The amount of money that can be obtained when selling investments',
      'The difference between the acquisition cost and the selling cost of investments',
      'The interest rate on the loan obtained for investment',
      'The amount of money invested in investments',
    ],
  ),
  QuizQuestion(
    question: 'What is inflation?',
    answer: 'Decrease in the value of money over time',
    options: [
      'Increase in the value of investments',
      'Decrease in the value of money over time',
      'Increase in the interest rate on a loan',
      'Growth in economic expansion and productivity',
    ],
  ),
];

List<QuizQuestion> questions_2 = [
  QuizQuestion(
    question: 'What are stocks?',
    answer: 'Investing money in securities with the aim of making a profit',
    options: [
      'Investing money in securities with the aim of making a profit',
      'Purchasing real estate with the aim of making a profit',
      'Starting your own business',
      'Entering into an agreement with a bank to obtain a loan'
    ],
  ),
  QuizQuestion(
    question: 'What are bonds?',
    answer: 'Investing money in securities with the aim of making a profit',
    options: [
      'Investing money in securities with the aim of making a profit',
      'Purchasing real estate with the aim of making a profit',
      'Starting your own business',
      'Entering into an agreement with a bank to obtain a loan'
    ],
  ),
  QuizQuestion(
    question: 'What is real estate?',
    answer: 'Purchasing real estate with the aim of making a profit',
    options: [
      'Investing money in securities with the aim of making a profit',
      'Purchasing real estate with the aim of making a profit',
      'Starting your own business',
      'Entering into an agreement with a bank to obtain a loan',
    ],
  ),
  QuizQuestion(
    question: 'What are investment funds?',
    answer:
        'Investing money in a portfolio of various assets managed by professional fund managers',
    options: [
      'Investing money in securities with the aim of making a profit',
      'Purchasing real estate with the aim of making a profit',
      'Starting your own business',
      'Investing money in a portfolio of various assets managed by professional fund managers',
    ],
  ),
  QuizQuestion(
    question: 'What is cryptocurrency?',
    answer: 'Investing in digital currency based on cryptography',
    options: [
      'Investing money in securities with the aim of making a profit',
      'Purchasing real estate with the aim of making a profit',
      'Starting your own business',
      'Investing in digital currency based on cryptography',
    ],
  ),
];

List<QuizQuestion> questions_3 = [
  QuizQuestion(
    question: 'What is risk in investments?',
    answer: 'The possibility of losing invested funds',
    options: [
      'The possibility of losing invested funds',
      'Guaranteed profit',
      'Starting your own business',
      'Obtaining a loan from a bank'
    ],
  ),
  QuizQuestion(
    question: 'What is return on investment?',
    answer: 'Guaranteed profit',
    options: [
      'The possibility of losing invested funds',
      'Guaranteed profit',
      'Starting your own business',
      'Obtaining a loan from a bank'
    ],
  ),
  QuizQuestion(
    question: 'What factor influences the level of risk in investments?',
    answer: 'Size of the invested funds',
    options: [
      'The possibility of losing invested funds',
      'Guaranteed profit',
      'Size of the invested funds',
      'Obtaining a loan from a bank',
    ],
  ),
  QuizQuestion(
    question: 'What factor influences the level of return on investment?',
    answer: 'Size of the invested funds',
    options: [
      'The possibility of losing invested funds',
      'Guaranteed profit',
      'Size of the invested funds',
      'Obtaining a loan from a bank',
    ],
  ),
  QuizQuestion(
    question: 'What is diversification in investments?',
    answer: 'Allocating invested funds across different assets to reduce risk',
    options: [
      'The possibility of losing invested funds',
      'Guaranteed profit',
      'Allocating invested funds across different assets to reduce risk',
      'Obtaining a loan from a bank',
    ],
  ),
];

List<QuizQuestion> questions_4 = [
  QuizQuestion(
    question:
        'What rule of portfolio diversification is recommended to follow?',
    answer: 'Divide investments across different assets and industries',
    options: [
      'Invest all funds in one company',
      'Divide investments across different assets and industries',
      'nvest only in one type of asset',
      'Completely avoid investments'
    ],
  ),
  QuizQuestion(
    question:
        'Which principle of diversification helps reduce risk in investments?',
    answer: 'Diversifying investments across different assets and industries',
    options: [
      'Investing only in one company',
      'Diversifying investments across different assets and industries',
      'Investing only in one type of asset',
      'Avoiding investments'
    ],
  ),
  QuizQuestion(
    question: 'Which assets can be included in a diversified portfolio?',
    answer: 'Stocks of different companies and bonds of different issuers',
    options: [
      'Only stocks of one company',
      'Only bonds of one issuer',
      'Stocks of different companies and bonds of different issuers',
      'Real estate',
    ],
  ),
  QuizQuestion(
    question:
        'Which principle of diversification helps reduce risk in investments?',
    answer: 'Diversifying investments across different assets and industries',
    options: [
      'Investing only in one type of asset',
      'Diversifying investments across different assets and industries',
      'Investing only in one company',
      'Avoiding investments',
    ],
  ),
  QuizQuestion(
    question: 'What benefits can portfolio diversification bring?',
    answer: 'Reduced risk in investments',
    options: [
      'Guaranteed profit',
      'Increased risk in investments',
      'Reduced risk in investments',
      'The opportunity to obtain a loan from a bank',
    ],
  ),
];

List<QuizQuestion> questions_5 = [
  QuizQuestion(
    question:
        'Which financial indicator of a company helps assess its financial stability?',
    answer: 'Debt load',
    options: [
      'Net profit',
      'Current assets',
      'Debt load',
      'Market capitalization'
    ],
  ),
  QuizQuestion(
    question:
        'Which financial indicator of a company helps assess its profitability?',
    answer: 'Net profit',
    options: [
      'Net profit',
      'Current assets',
      'Debt load',
      'Market capitalization'
    ],
  ),
  QuizQuestion(
    question:
        'Which financial indicator of a company helps assess its liquidity?',
    answer: 'Current assets',
    options: [
      'Net profit',
      'Current assets',
      'Debt load',
      'Market capitalization',
    ],
  ),
  QuizQuestion(
    question:
        'Which financial indicator of a company helps assess its market value?',
    answer: 'Market capitalization',
    options: [
      'Net profit',
      'Current assets',
      'Debt load',
      'Market capitalization',
    ],
  ),
  QuizQuestion(
    question:
        'Which financial indicator of a company helps assess its efficiency in using assets?',
    answer: 'Current assets',
    options: [
      'Net profit',
      'Current assets',
      'Debt load',
      'Market capitalization',
    ],
  ),
];

List<QuizQuestion> questions_6 = [
  QuizQuestion(
    question: 'Which chart is used for analyzing price movements of stocks?',
    answer: 'Candlestick chart',
    options: ['Line chart', 'Candlestick chart', 'Pie chart', 'Histogram'],
  ),
  QuizQuestion(
    question: 'Which indicator is used to identify trends in the market?',
    answer: 'Bollinger Bands',
    options: [
      'RSI (Relative Strength Index)',
      'MACD (Moving Average Convergence Divergence)',
      'Bollinger Bands',
      'Stochastic Oscillator'
    ],
  ),
  QuizQuestion(
    question: 'Which chart is used to determine support and resistance levels?',
    answer: 'Line chart',
    options: [
      'Line chart',
      'Candlestick chart',
      'Volume chart',
      'Volume bar chart',
    ],
  ),
  QuizQuestion(
    question:
        'Which indicator is used to determine overbought or oversold conditions of a stock?',
    answer: 'RSI (Relative Strength Index)',
    options: [
      'RSI (Relative Strength Index)',
      'MACD (Moving Average Convergence Divergence)',
      'Bollinger Bands',
      'Stochastic Oscillator',
    ],
  ),
  QuizQuestion(
    question:
        'Which indicator is used to determine the strength and direction of a trend?',
    answer: 'MACD (Moving Average Convergence Divergence)',
    options: [
      'RSI (Relative Strength Index)',
      'MACD (Moving Average Convergence Divergence)',
      'Bollinger Bands',
      'Stochastic Oscillator',
    ],
  ),
];

List<QuizQuestion> questions_7 = [
  QuizQuestion(
    question:
        'Which financial indicator is used to assess the financial stability of a company?',
    answer: 'Debt/equity ratio',
    options: ['Net profit', 'Total assets', 'Debt/equity ratio', 'Revenue'],
  ),
  QuizQuestion(
    question:
        '''Which method is used to estimate the value of a company's stocks based on future cash flows?''',
    answer: 'Discounted Cash Flow (DCF) method',
    options: [
      'Discounted Cash Flow (DCF) method',
      'Comparable company analysis',
      'Market capitalization method',
      'Book value method'
    ],
  ),
  QuizQuestion(
    question:
        '''Which indicator is used to assess the efficiency of a company's asset management?''',
    answer: 'ROA (Return on Assets)',
    options: [
      'ROA (Return on Assets)',
      'ROE (Return on Equity)',
      'EPS (Earnings Per Share)',
      'P/E (Price/Earnings)',
    ],
  ),
  QuizQuestion(
    question:
        'Which financial indicator is used to assess the liquidity of a company?',
    answer: 'Current ratio',
    options: [
      'Asset turnover',
      'Current ratio',
      'Return on equity',
      'Net profit',
    ],
  ),
  QuizQuestion(
    question:
        '''Which indicator is used to assess the market price of a company's stocks?''',
    answer: 'P/E (Price/Earnings)',
    options: [
      'P/E (Price/Earnings)',
      'ROE (Return on Equity)',
      'EPS (Earnings Per Share)',
      'ROA (Return on Assets)',
    ],
  ),
];

List<QuizQuestion> questions_8 = [
  QuizQuestion(
    question:
        'What emotion can an investor experience when they see that the stock price of a company they invested in is sharply falling?',
    answer: 'Anger',
    options: ['Joy', 'Anger', 'Surprise', 'Indifference'],
  ),
  QuizQuestion(
    question:
        '''Which of the following statements is correct regarding the emotional impact on investment decision-making?''',
    answer: 'Emotions always lead to irrational investment decisions',
    options: [
      'Emotions play no role in investment decision-making',
      'Emotions can help make informed investment decisions',
      'Emotions always lead to irrational investment decisions',
      'Emotions only affect novice investors'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following emotions can lead to making overly risky investment decisions?''',
    answer: 'Joy',
    options: [
      'Fear',
      'Joy',
      'Anger',
      'Satisfaction',
    ],
  ),
  QuizQuestion(
    question:
        'What emotion can an investor experience when they see that the stock price of a company they invested in is sharply rising?',
    answer: 'Joy',
    options: [
      'Fear',
      'Anger',
      'Joy',
      'Satisfaction',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies can help an investor control emotions and make rational investment decisions?''',
    answer: 'P/E (Price/Earnings)',
    options: [
      'Investing only in one company',
      'Ignoring financial news',
      'Diversifying the portfolio',
      'Buying stocks only at their peak prices',
    ],
  ),
];

List<QuizQuestion> questions_9 = [
  QuizQuestion(
    question:
        'Which of the following strategies is fundamental in long-term investing?',
    answer: 'Passive investing',
    options: [
      'Active trading investment',
      'Passive investing',
      'Speculative investing',
      'Short-term investing'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following factors is important when choosing stocks for long-term investing?''',
    answer: 'Emotions always lead to irrational investment decisions',
    options: [
      'Short-term trend dynamics of stocks',
      'News events of the last month',
      '''Company's dividend history''',
      'Short-term market fluctuations'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies can help an investor minimize risks in long-term investing?''',
    answer: 'Diversifying the portfolio across different assets and sectors',
    options: [
      'Investing only in one company',
      'Investing only in new startups',
      'Diversifying the portfolio across different assets and sectors',
      'Buying stocks only at their peak prices',
    ],
  ),
  QuizQuestion(
    question:
        'Which of the following factors should be considered when determining the time for long-term investing?',
    answer: '''Investor's financial goals''',
    options: [
      'Market cyclicality',
      '''Investor's interest in short-term profits''',
      '''Investor's financial goals''',
      'Short-term market trend dynamics',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies can be effective in long-term investing?''',
    answer: 'Analyzing fundamental indicators of companies before investing',
    options: [
      'Frequent buying and selling of stocks for short-term profits',
      'Ignoring financial news and events',
      'Analyzing fundamental indicators of companies before investing',
      'Focusing on short-term market trends',
    ],
  ),
];

List<QuizQuestion> questions_10 = [
  QuizQuestion(
    question:
        'Which of the following strategies is fundamental in stock market trading?',
    answer: 'Passive investing',
    options: [
      'Active trading investment',
      'Passive investing',
      'Speculative investing',
      'Short-term investing'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following factors is important when choosing stocks for trading on the stock market?''',
    answer: 'Financial indicators of the company',
    options: [
      'Short-term trend dynamics of stocks',
      'News events of the last month',
      '''Financial indicators of the company''',
      'Short-term market fluctuations'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies can help a trader minimize risks in stock market trading?''',
    answer: 'Diversifying the portfolio across different stocks and sectors',
    options: [
      'Trading only one type of stock',
      'Trading only at the peak of stock prices',
      'Diversifying the portfolio across different stocks and sectors',
      'Ignoring financial news and events',
    ],
  ),
  QuizQuestion(
    question:
        'Which of the following factors should be considered when determining the timing for stock market trading?',
    answer: '''Trader's financial goals''',
    options: [
      '''Trader's interest in short-term profits''',
      '''Dynamics of short-term market trends''',
      '''Trader's financial goals''',
      'Seasonality of the market',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies can be effective in stock market trading?''',
    answer: 'Analyzing technical indicators before trading',
    options: [
      'Frequent buying and selling of stocks for short-term profits',
      'Ignoring financial news and events',
      'Analyzing technical indicators before trading',
      'Focusing on short-term market trends',
    ],
  ),
];

List<QuizQuestion> questions_11 = [
  QuizQuestion(
    question: 'Factors to consider when choosing a startup for investment?',
    answer: 'All of the above',
    options: [
      'Market size and growth potential',
      'Team experience and level of competition',
      'Technological innovation and uniqueness of the product',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question: '''Types of investments in startups?''',
    answer: 'Financial indicators of the company',
    options: [
      'Direct investments',
      'Investments through venture capital funds',
      '''Crowdfunding''',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question:
        '''What percentage of startups achieves success and brings high profits?''',
    answer: 'About 75%',
    options: [
      'About 10%',
      'About 25%',
      'About 50%',
      'About 75%',
    ],
  ),
  QuizQuestion(
    question: 'Risks associated with investing in startups?',
    answer: '''All of the above''',
    options: [
      '''High level of uncertainty and the possibility of investment loss''',
      '''Inability to quickly liquidate assets''',
      '''High competition in the startup market''',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question: '''Strategies for managing risks when investing in startups?''',
    answer: 'All of the above',
    options: [
      'Diversification of investment portfolios',
      '''Thorough analysis of the startup's business model and financial stability''',
      'Establishment of clear contractual terms and investment rules',
      'All of the above',
    ],
  ),
];

List<QuizQuestion> questions_12 = [
  QuizQuestion(
    question: 'What technology is the foundation of blockchain?',
    answer: 'Decentralized database',
    options: [
      'Artificial Intelligence',
      'Centralized database',
      'Decentralized database',
      'Cloud computing'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following advantages are associated with the use of cryptocurrencies?''',
    answer: 'Low fees and fast transfers',
    options: [
      'Anonymity and untraceability of transactions',
      'Low fees and fast transfers',
      '''High protection against fraud''',
      'The possibility of high profits without risk'
    ],
  ),
  QuizQuestion(
    question: '''What is ICO (Initial Coin Offering)?''',
    answer:
        'A method of fundraising in which a company issues its own cryptocurrency',
    options: [
      'An online store that accepts cryptocurrency payments',
      'A method of fundraising in which a company issues its own cryptocurrency',
      'A cryptocurrency exchange where various types of cryptocurrencies can be traded',
      'A method of cryptocurrency mining using specialized equipment',
    ],
  ),
  QuizQuestion(
    question:
        'Which of the following technologies is used to ensure the security of transactions in blockchain?',
    answer: '''Data encryption''',
    options: [
      '''Data encryption''',
      '''Artificial Intelligence''',
      '''Centralized database''',
      'Decentralized database',
    ],
  ),
  QuizQuestion(
    question:
        '''What is a risk associated with investing in cryptocurrencies?''',
    answer: 'High price volatility in the cryptocurrency market',
    options: [
      'High price volatility in the cryptocurrency market',
      '''Low transaction fees''',
      'Fast transfers without the need for intermediaries',
      'High protection against fraud',
    ],
  ),
];

List<QuizQuestion> questions_13 = [
  QuizQuestion(
    question:
        'What factor is the most important when choosing a startup for investment?',
    answer: 'All of the above',
    options: [
      'Market size and growth potential',
      'Team experience and level of competition',
      'Technological innovation and uniqueness of the product',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question: '''What types of investments in startups exist?''',
    answer: 'All of the above',
    options: [
      'Direct investments',
      'Investments through venture funds',
      '''Crowdfunding''',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question:
        '''What percentage of startups achieves success and brings high profits?''',
    answer: 'About 75%',
    options: [
      'About 10%',
      'About 25%',
      'About 50%',
      'About 75%',
    ],
  ),
  QuizQuestion(
    question: 'What risks are associated with investing in startups?',
    answer: '''All of the above''',
    options: [
      '''High level of uncertainty and the possibility of investment loss''',
      '''Inability to quickly liquidate assets''',
      '''High competition in the startup market''',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        '''What strategies can be used to manage risks when investing in startups?''',
    answer: 'All of the above',
    options: [
      'Diversification of investment portfolios',
      '''Thorough analysis of the startup's business model and financial sustainability''',
      'Establishing clear contract conditions and investment rules',
      'All of the above',
    ],
  ),
];

List<QuizQuestion> questions_14 = [
  QuizQuestion(
    question:
        'Which of the following advantages is associated with real estate purchase?',
    answer: 'High return on investment',
    options: [
      'High return on investment',
      'Low risk of investment loss',
      'Guaranteed stability of real estate market prices',
      'Opportunity for quick sale and profit'
    ],
  ),
  QuizQuestion(
    question: '''What factor is a risk in renting real estate?''',
    answer: 'High maintenance and repair costs',
    options: [
      'Loss of property value',
      'High maintenance and repair costs',
      '''Limited opportunities for income''',
      'Possibility of a quick return on investment'
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following advantages is associated with real estate development?''',
    answer: '''Increase in the property's value''',
    options: [
      '''Increase in the property's value''',
      'Guaranteed steady rental income',
      'Low risk of investment loss',
      'Opportunity for quick sale and profit',
    ],
  ),
  QuizQuestion(
    question:
        'Which of the following strategies is the riskiest in real estate investment?',
    answer: '''All of the above''',
    options: [
      '''Purchasing property for subsequent rental''',
      '''Developing and improving existing real estate''',
      '''Purchasing property for subsequent profitable sale''',
      'Investing in real estate through the stock market',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following factors is an advantage in real estate investment?''',
    answer: 'Guaranteed stability of real estate market prices',
    options: [
      'Opportunity to achieve high returns without risk',
      '''Low transaction fees''',
      'Guaranteed stability of real estate market prices',
      'Fast transfers without the need for intermediaries',
    ],
  ),
];

List<QuizQuestion> questions_15 = [
  QuizQuestion(
    question: 'What factors influence the value of a work of art?',
    answer: 'All of the above',
    options: [
      '''Artist's name and reputation''',
      'Execution technique and materials',
      'Historical and cultural significance of the work',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question: '''Which types of art are most popular among collectors?''',
    answer: 'All of the above',
    options: ['Painting', 'Sculpture', '''Photography''', 'All of the above'],
  ),
  QuizQuestion(
    question: '''What risks are associated with investing in art?''',
    answer: '''All of the above''',
    options: [
      '''Possibility of forgery''',
      'Uncertainty in assessing the value of the work',
      'Limited market for buyers',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        'What strategies can be used to manage risks when investing in art?',
    answer: '''All of the above''',
    options: [
      '''Consulting experts and appraisers''',
      '''Diversification in the art collection''',
      '''Studying the history and trends of the art market''',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question: '''What factors influence the value of collectible items?''',
    answer: 'All of the above',
    options: [
      'Rarity and uniqueness of the item',
      '''Condition and preservation of the item''',
      'Historical and cultural significance of the item',
      'All of the above',
    ],
  ),
];

List<QuizQuestion> questions_16 = [
  QuizQuestion(
    question:
        'What factors influence the success of retirement planning and investments?',
    answer: 'All of the above',
    options: [
      '''Early start of planning and investing''',
      'High income level',
      'Diversification of investment portfolio',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question:
        '''What types of investments can be used for retirement planning?''',
    answer: 'All of the above',
    options: ['Stocks', 'Bonds', '''Real estate''', 'All of the above'],
  ),
  QuizQuestion(
    question:
        '''What risks are associated with investing for retirement planning?''',
    answer: '''All of the above''',
    options: [
      '''Market fluctuations and investment loss''',
      'Inflation, reducing the purchasing power of savings',
      'Low investment returns',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        'What strategies can be used for successful retirement planning and investments?',
    answer: '''All of the above''',
    options: [
      '''Regularly saving money for retirement''',
      '''Diversifying investments across different assets''',
      '''Gradually reducing risky investments with age''',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        '''What factors contribute to achieving financial independence in retirement?''',
    answer: 'All of the above',
    options: [
      'High savings level',
      '''Rational expense management''',
      'Effective investing',
      'All of the above',
    ],
  ),
];

List<QuizQuestion> questions_17 = [
  QuizQuestion(
    question:
        'What factor is an advantage of investing in gold and precious metals?',
    answer: 'Guaranteed price stability in the gold and precious metals market',
    options: [
      '''High returns without risk''',
      'Low transaction fees',
      'Guaranteed price stability in the gold and precious metals market',
      'Fast transfers without the need for intermediaries'
    ],
  ),
  QuizQuestion(
    question:
        '''What factor is a risk of investing in gold and precious metals?''',
    answer: 'Loss of investment value',
    options: [
      'Loss of investment value',
      'High returns without risk',
      '''Guaranteed price stability in the gold and precious metals market''',
      'Fast transfers without the need for intermediaries'
    ],
  ),
  QuizQuestion(
    question:
        '''What advantage is associated with investing in gold and precious metals?''',
    answer:
        '''Guaranteed price stability in the gold and precious metals market''',
    options: [
      '''Possibility of high returns without risk''',
      'Low transaction fees',
      'Guaranteed price stability in the gold and precious metals market',
      'Fast transfers without the need for intermediaries',
    ],
  ),
  QuizQuestion(
    question:
        'What factor is an advantage of investing in gold and precious metals?',
    answer: '''High returns without risk''',
    options: [
      '''Possibility of high returns without risk''',
      '''High returns without risk''',
      '''Guaranteed price stability in the gold and precious metals market''',
      'Fast transfers without the need for intermediaries',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies is the riskiest when investing in gold and precious metals?''',
    answer: 'Actively managing a portfolio of gold coins and bars',
    options: [
      'Investing in various companies engaged in gold mining and production',
      '''Passive investment in gold funds''',
      'Actively managing a portfolio of gold coins and bars',
      'Investing in non-precious metals through funds',
    ],
  ),
];

List<QuizQuestion> questions_18 = [
  QuizQuestion(
    question: 'What factor is an advantage of investing in funds and ETFs?',
    answer: 'Low transaction fees',
    options: [
      '''High returns without risk''',
      'Low transaction fees',
      'Guaranteed price stability in the fund and ETF market',
      'Fast transfers without the need for intermediaries'
    ],
  ),
  QuizQuestion(
    question: '''What factor is a risk of investing in funds and ETFs?''',
    answer: '''Loss of investment value''',
    options: [
      '''Loss of investment value''',
      'High returns without risk',
      'Guaranteed price stability in the fund and ETF market',
      'Fast transfers without the need for intermediaries',
    ],
  ),
  QuizQuestion(
    question:
        '''What advantage is associated with investing in funds and ETFs?''',
    answer: 'Low transaction fees',
    options: [
      'Possibility of high returns without risk',
      'Low transaction fees',
      '''Guaranteed price stability in the fund and ETF market''',
      'Fast transfers without the need for intermediaries'
    ],
  ),
  QuizQuestion(
    question: 'What factor is an advantage of investing in funds and ETFs?',
    answer: '''Guaranteed price stability in the fund and ETF market''',
    options: [
      '''Possibility of high returns without risk''',
      '''High returns without risk''',
      '''Guaranteed price stability in the fund and ETF market''',
      'Fast transfers without the need for intermediaries',
    ],
  ),
  QuizQuestion(
    question:
        '''Which of the following strategies is the riskiest when investing in funds and ETFs?''',
    answer: 'Actively managing a portfolio of funds and ETFs',
    options: [
      'nvesting in various economic sectors through ETFs',
      '''Passive investment in a broad index fund''',
      'Actively managing a portfolio of funds and ETFs',
      'Investing in bonds through funds',
    ],
  ),
];

List<QuizQuestion> questions_19 = [
  QuizQuestion(
    question: 'What are the benefits of social investment?',
    answer: 'All of the above',
    options: [
      'Financial profit',
      'Positive impact on society and the environment',
      '''Improvement of the company's reputation''',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question: 'What forms of social investment exist?',
    answer: 'All of the above',
    options: [
      'Investment in social enterprises',
      'Donations to charitable organizations',
      'Investment in sustainable development projects',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question: 'What principles of social investment can be utilized?',
    answer: 'All of the above',
    options: [
      'Transparency and reporting',
      'Consideration of social and environmental factors in decision-making',
      'Collaboration with stakeholders',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question: 'What problems may arise with social investment?',
    answer: 'All of the above',
    options: [
      '''Insufficient information about projects and organizations''',
      'Difficulty in measuring the social and environmental effectiveness of investments',
      'Risk of financial loss',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        'What factors can influence the choice of social projects for investment?',
    answer: 'All of the above',
    options: [
      '''Alignment with the investor's goals and values''',
      'Potential social and environmental impact of the project',
      'Financial stability of the organization',
      'All of the above',
    ],
  ),
];

List<QuizQuestion> questions_20 = [
  QuizQuestion(
    question:
        'What are the advantages of investing in education and personal growth?',
    answer: 'All of the above',
    options: [
      'Financial profit',
      'Development of personal skills and competencies',
      'Improvement of career opportunities',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question:
        'What forms of investment in education and personal growth exist?',
    answer: 'All of the above',
    options: [
      'Investment in educational institutions',
      'Acquisition of educational materials and programs',
      'Financing scholarships and grants',
      'All of the above'
    ],
  ),
  QuizQuestion(
    question:
        'What principles of investing in education and personal growth can be utilized?',
    answer: 'All of the above',
    options: [
      'Individual approach to development',
      'Continuous updating of knowledge and skills',
      'Collaboration with experts and mentors',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        'What problems may arise when investing in education and personal growth?',
    answer: 'All of the above',
    options: [
      'High costs of education and development',
      'Insufficient quality of educational programs',
      'Limited access to educational resources',
      'All of the above',
    ],
  ),
  QuizQuestion(
    question:
        'What factors can influence the choice of projects for investing in education and personal growth?',
    answer: 'All of the above',
    options: [
      '''Alignment with the investor's goals and values''',
      'Quality of educational programs and resources',
      'Level of potential personal and professional transformation',
      'All of the above',
    ],
  ),
];
