# Deepseek-local

This is a repo to add possible ways to run deepseek, an LLM, locally. The motivations for this project are to provide users with the ability to run deep learning models on their local machines without relying on cloud services, ensuring data privacy and reducing latency.

## Comparison among Deepseek and other LLM implementations

You can read [here](https://www.researchgate.net/publication/388791877_A_Comparison_of_DeepSeek_and_Other_LLMs) an article about Deepseek being compared with other LLM's.

In summary, Deepseek achieves high performance using an architecture called Mixture of Experts (MoE), where multiple expert networks process different parts of an input, with only a subset of experts activated per query. For better details about how the training of the model works, and how this MoE framework provides the outpus of the model, check [here](https://blog.adyog.com/2025/02/01/how-deepseek-r1-was-built-architecture-and-training-explained/)


## The bigger your CPU, the bigger your model

In our case, we are using by default the tiniest of the available Deepseek models. Check [here](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B) the used model.

In case we want to use an LLM with a higher performance, would be use to consider a cluster to use.

## Implementations

We have two ways to run deespeek locally:

[docker-impl](./docker-impl/)

[python-imp](./python-imp/)

For each one you a `.sh` that works as entrypoint. Check the needed parameters in each case and run them, that's it :).

### Important to notice

So far each implementation has a different way to access to the models, if we are using Ollama to load the LLM, or python to access to hub.



