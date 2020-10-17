import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import SetupOptions

from apache_beam.io import ReadFromText


class WordcountOptions(PipelineOptions):
    @classmethod
    def _add_argparse_args(cls, parser):
        parser.add_value_provider_argument(
            "--input",
            # no default value
            # default="gs://dataflow-samples/shakespeare/kinglear.txt",
            help="Path of the file to read from",
            dest="input",
        )


def main(argv=None, savemain_session=True):
    options = WordcountOptions()
    setup_options = options.view_as(SetupOptions)

    wordcount_options = options.view_as(WordcountOptions)

    with beam.Pipeline(options=setup_options) as p:
        import logging 
        lines = p | "read" >> ReadFromText(wordcount_options.input)
        lines | "logging" >> beam.Map(lambda r: logging.info(r))


if __name__ == "__main__":
    main()
