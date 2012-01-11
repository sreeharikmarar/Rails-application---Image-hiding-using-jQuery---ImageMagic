# Author : Krishnaprasad Varma (kpvarma@presciencesoft.com)
# Date : 2 Jun, 2011
# All code (c)2011 Prescience Soft Pvt. Ltd. All rights reserved

class Asset < ActiveRecord::Base

  ## Set the table name
  set_table_name "assets"

  ## Specifies a white list of attributes that can be set via mass-assignment.
  attr_accessible :name, :content_type, :file_name, :document_file_name, :document_content_type, :document_file_size
  attr_accessible :document

  has_attached_file :document, :styles => { :tiny => "100x100>"},
    :url =>  "/public/uploaded_files/:style/:id.:extension",
    :path => ":rails_root/public/uploaded_files/:style/:id.:extension"

  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 5.megabytes
  validates_attachment_content_type :document, :content_type => ['application/txt', 'text/plain',
    'application/pdf', 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.oasis.opendocument.text',
    'application/x-vnd.oasis.opendocument.text',
    'application/rtf', 'application/x-rtf', 'text/rtf', 'text/richtext', 'application/doc', 'application/x-soffice', 'image/jpg', 'image/jpeg', 'image/png']
  
end
