# Terre Haute Regional
STATIONNAME="TerreHauteRegional"
CODES="724370-93823 724370-99999 724371-93823 724373-93823 724373-99999"

mkdir -p data
cd data

for f in 2009 2008 2007 2006 2005 2004 2003 2002 2001 2000 1999 1998 1997 1996 1995 1994 1993 1992 1991 1990 1989 1988 1987 1986 1985 1984 1983 1982 1981 1980 1979 1978 1977 1976 1975 1974 1973 1972 1971 1970 1969 1968 1967 1966 1965 1964 1963 1962 1961 1960 1959 1958 1957 1956 1955
do
  echo ${f}
  for c in ${CODES}; do
    wget ftp://ftp.ncdc.noaa.gov/pub/data/gsod/${f}/${c}-${f}.op.gz
  done
done

gunzip *.gz

touch ${STATIONNAME}.op
for f in 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009
do
  echo ${f}
  for c in ${CODES}; do
    cat ${c}-${f}.op >> ${STATIONNAME}.op
  done
done

grep -v YEARMODA ${STATIONNAME}.op > junk1

cut -c 14-31 junk1 > ${STATIONNAME}.dat
cut -c 14-22 junk1 > Dates.dat

rm junk1

cd ..