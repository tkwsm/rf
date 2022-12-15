# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Gene.create( project_id:66613, seqid:'chr66613', gsource:'testdata', gtype:'gene', gstart:101, gend:2100, gscore:0, gstrand:'+', gphase:'.', geneid:'TestGM000001')
Gene.create( project_id:66613, seqid:'chr66613', gsource:'testdata', gtype:'gene', gstart:22001, gend:2500, gscore:0, gstrand:'-', gphase:'.', geneid:'TestGM000002')
Gene.create( project_id:66613, seqid:'chr66613', gsource:'testdata', gtype:'gene', gstart:31101, gend:3500, gscore:0, gstrand:'+', gphase:'.', geneid:'TestGM000003')
Gene.create( project_id:66613, seqid:'chr66614', gsource:'testdata', gtype:'gene', gstart:101, gend:2200, gscore:0, gstrand:'-', gphase:'.', geneid:'TestGM000101')

