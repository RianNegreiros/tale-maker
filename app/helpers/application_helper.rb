module ApplicationHelper
  def generate_response()
    api_key = ENV.fetch("OPENAI_API_KEY")
    engine = ENV.fetch("OPENAI_ENGINE")
    prompt = "This is a test."

    openai_client = OpenAI::Client.new(access_token: api_key, default_engine: engine)
    response = openai_client.completions(prompt: prompt, max_tokens: 5000, engine: engine)
    text = response.data["choices"][0]["text"]
  end

  def generate_image()
    api_key = ENV.fetch("OPENAI_API_KEY")
    OpenAI.configure do |config|
      config.api_key = api_key
    end
    openai_client = OpenAI::Client.new(access_token: api_key)
    response = openai_client.images.generate(prompt: "Random image for testing", size: "512x512")
    response.dig("data", 0, "url")
  end
end
