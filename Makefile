.PHONY: run test lint clean outputs

# Run the full pipeline
run:
	python -m src.pipeline

# Run all tests
test:
	pytest tests/ -v

# Run tests with coverage
coverage:
	pytest tests/ -v --cov=src --cov-report=term-missing

# Lint (optional — install ruff first: pip install ruff)
lint:
	ruff check src/ tests/ || true

# Clean generated outputs
clean:
	rm -rf outputs/
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -name "*.pyc" -delete 2>/dev/null || true

# Create output directory
outputs:
	mkdir -p outputs

# Show help
help:
	@echo "Available targets:"
	@echo "  run      - Run the full pipeline (python -m src.pipeline)"
	@echo "  test     - Run all tests with pytest"
	@echo "  coverage - Run tests with coverage report"
	@echo "  lint     - Run linter (requires ruff)"
	@echo "  clean    - Remove generated outputs and cache"
