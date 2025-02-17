import sys
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

# Get the model name and prompt from command line arguments
MODEL_NAME = sys.argv[1]
PROMPT = sys.argv[2]

dtype = torch.float16 if torch.cuda.is_available() else torch.float32

print(f"Loading model: {MODEL_NAME}")

# Load model and tokenizer
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, trust_remote_code=True)
model = AutoModelForCausalLM.from_pretrained(
    MODEL_NAME,
    torch_dtype=dtype,
    device_map="auto"  # Uses GPU if available
)

# Generate text
print(f"Generating response for prompt: {PROMPT}")
PROMPT = PROMPT.strip()
inputs = tokenizer(PROMPT, return_tensors="pt").to(model.device)
outputs = model.generate(**inputs, max_length=200)

# Decode output
print("\nGenerated Response:")
print(tokenizer.decode(outputs[0], skip_special_tokens=True))
