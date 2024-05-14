# Stock Market Analysis with Llama 3 Function Calling

[Website](https://fin.furyhawk.lol/)
Welcome to the Stock Market Analyst! This is a Streamlit web application that leverages the yfinance API to provide insights into stocks and their prices. The application uses the Llama 3 model on Groq in conjunction with Langchain to call functions based on the user prompt.

## Key Functions

- **get_stock_info(symbol, key)**: This function fetches various information about a given stock symbol. The information can be anything from the company's address to its financial ratios. The 'key' parameter specifies the type of information to fetch.

- **get_historical_price(symbol, start_date, end_date)**: This function fetches the historical stock prices for a given symbol from a specified start date to an end date. The returned data is a DataFrame with the date and closing price of the stock.

- **plot_price_over_time(historical_price_dfs)**: This function takes a list of DataFrames (each containing historical price data for a stock) and plots the prices over time using Plotly. The plot is displayed in the Streamlit app.

- **call_functions(llm_with_tools, user_prompt)**: This function takes the user's question, invokes the appropriate tool (either get_stock_info or get_historical_price), and generates a response. If the user asked for historical prices, it also calls plot_price_over_time to generate a plot.

## Function Calling

The function calling in this application is handled by the Groq API, abstracted with Langchain. When the user asks a question, the application invokes the appropriate tool with parameters based on the user's question. The tool's output is then used to generate a response.

## Usage

1. Clone the repository to your local machine.

2. Install the required dependencies listed in the **requirements.txt** file.

3. create a .env file with the following command:
```sh
cp .env.example .env
```
and add your GROQ_API_KEY to the .env file:
```sh
GROQ_API_KEY=YOUR_GROQ_API_KEY
```

4. Run the application using Streamlit with the command `streamlit run app.py`.

5. In the application, enter your question about a stock in the text input field. For example, "What is the current price of Google stock?" or "Show me the historical prices of Amazon and Tesla over the past year.".

6. If you want to provide additional context for the language model, you can do so in the sidebar.

# Dockerfile
```sh
docker compose up --build -d
```