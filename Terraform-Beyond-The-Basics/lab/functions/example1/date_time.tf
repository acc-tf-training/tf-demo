locals {
 first = formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
 second = timeadd("2017-11-22T00:00:00Z", "10m")
 thrid  =  timestamp()
}


output "output_first" {
  value = local.first

} 


output "output_second" {
  value = local.second
}

output "output_thrid" {
  value = local.thrid
}
