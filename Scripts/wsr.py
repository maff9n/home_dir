from time import strftime
from pathlib import Path
from typing import Literal
from subprocess import call
from functools import partial
from collections import namedtuple
from typing import NamedTuple


class Info:
    name = "Marvin"

    local_wiki: Path = Path("$HOME/Projects/wsr.wiki")
    local_wiki_relativ_wsr_path: Path = Path("")
    local_wiki_relativ_file_wsr_is_mentioned: Path = Path("")

    remote_wiki: str = "https://gitlab.vpn.cyberus-technology.de/mmann/wsr/-/wikis/"

    editor = partial(call("/bin/typora"))

    def get_wsr_default_file_name() -> str:
        return strftime("WSR%Y-W%U")


State = Literal["ON", "OFF"]


class Functionality(NamedTuple):
    state: State
    description: str
    function: None


cp_web_link = Functionality("ON", "Do something", lambda: print "Hallo")


def main():
    print(Info.name)


if __name__ == '__main__':
    main()
