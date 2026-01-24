import os
import sys
import argparse
import getpass


def listdirs(folder):
    return [d for d in os.listdir(folder) if os.path.isdir(os.path.join(folder, d))]


user = getpass.getuser()

parser = argparse.ArgumentParser(
    description="file to generate txt file of journal entries"
)
parser.add_argument(
    "-path",
    type=str,
    help="path to base journal folder",
    default=f"/home/{user}/my_log",
)
parser.add_argument(
    "-type", type=str, help="generate for an .md file or .txt file", default="md"
)

args = parser.parse_args()

rootdir = args.path
filetype = args.type

years = listdirs(rootdir)


with open(f"/home/{user}/compiled.{filetype}", "w") as f:
    f.writelines("# Journal\n\n")
    for year in sorted(years):
        f.writelines("## Year " + str(year) + "\n\n")
        year_path = os.path.join(rootdir, year)
        dates = listdirs(year_path)
        for date in sorted(dates):
            date_path = os.path.join(year_path, date)
            hours = os.listdir(date_path)
            if len(hours) == 0:
                os.rmdir(date_path)  # clean empty days
            if filetype == "md":
                f.writelines("<details open>\n" + "<summary>" + str(date) + "</summary>\n\n")
            else:
                f.writelines("### Day " + str(date) + "\n\n")
            for hour in sorted(hours):
                hour_path = os.path.join(date_path, hour)
                with open(hour_path, "r") as entry:
                    log = entry.read()
                    log = log.strip()
                    if len(log) == 0:
                        os.remove(hour_path)
                        continue
                    f.writelines("### " + str(hour) + "\n\n")
                    f.writelines(log)
                    f.writelines("\n\n")
            if filetype == "md":
                f.writelines("</details>\n\n---\n\n")
            else:
                f.writelines("\n\n---\n\n")

print(f"Created compiled.{filetype} at {rootdir}")
