# Variables
# NSX Manager

variable "nsx_manager" {
    default = "srv-nsxt-manager-01.megasp.net"
}

# Username & Password for NSX-T Manager

    variable "username" {
    default = "admin"
}

variable "password" {
    default = "   "
}

# Enter Edge Nodes Display Name. Required for external interfaces.

variable "edge_node_01" {
    default = "EDGE-01"
}
variable "edge_node_02" {
    default = "EDGE-02"
}

variable "edge_node_03" {
    default = "EDGE-03"
}
variable "edge_node_04" {
    default = "EDGE-04"
}

variable "edge_cluster_01" {
    default = "Edge-Cluster-01"
}

variable "edge_cluster_02" {
    default = "Edge-Cluster-02"
}

# Transport Zones

variable "tz_overlay" {
    default = "TZ-Overlay"
}

variable "tz_vlan" {
    default = "TZ-VLAN"
}
























# Segment Names
variable "nsx_segment_web" {
    default = "VM-Segment-Web"
}
variable "nsx_segment_app" {
    default = "VM-Segment-App"
}

variable "nsx_segment_db" {
    default = "VM-Segment-DB"
}

# Security Group names. 
variable "nsx_group_web" {
    default = "Web Servers"
}

variable "nsx_group_app" {
    default = "App Servers"
}

variable "nsx_group_db" {
    default = "DB Servers"
}

variable "nsx_group_blue" {
    default = "Blue Application"
}

variable "nsx_group_red" {
    default = "Red Application"
}