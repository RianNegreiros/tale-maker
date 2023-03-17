module ApplicationHelper
  def generate_response()
    api_key = ENV.fetch("OPENAI_API_KEY")
    engine = ENV.fetch("OPENAI_ENGINE")
    prompt = "This is a test."

    openai_client = OpenAI::Client.new(api_key: api_key, default_engine: engine)
    response = openai_client.completions(prompt: prompt, max_tokens: 5000, engine: engine)
    text = response.data["choices"][0]["text"]
  end
end
