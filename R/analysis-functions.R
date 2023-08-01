fread_many = function(files,header=T,...){
  if(length(files)==0) return()
  if(typeof(files)!='character') return()
  files = files[file.exists(files)]
  if(length(files)==0) return()
  tmp = tempfile(fileext = ".csv")
  # note 1: requires awk, not cat or tail because some files have no final newline
  # note 2: parallel --xargs is 40% slower
  # note 3: reading to var is 15% slower and crashes R if the string is too long
  # note 4: shorter paths -> more paths per awk -> fewer awks -> measurably faster
  #         so best cd to the csv dir and use relative paths
  if(header==T){
    system(paste0('head -n1 ',files[1],' > ',tmp))
    system(paste0("xargs awk 'FNR>1' >> ",tmp),input=files)
  } else {
    system(paste0("xargs awk '1' > ",tmp),input=files)
  }
  DT = fread(file=tmp,header=header,...)
  file.remove(tmp)
  DT
}