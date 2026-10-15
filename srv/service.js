const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService { init() {

  //const { Books, Authors, GenresVH, BookStatus, Chapters } = cds.entities('BookstoreService')
  const { Books } = cds.entities('BookstoreService')

  //this.before (['CREATE', 'UPDATE','READ'], Books, async (req) => {
    this.before ('READ', Books, async (req) => {
    console.log('Before READ Books')
    })
    console.log("ON Event")
    this.on('READ',Books,async(req, next)=> {
    return next()
   });
  this.after ('READ', Books, async (books, req) => {
   // console.log('After READ Books', books)
  //  console.log(books)
   for(const book of books){
    if(book.genre_code==='genre-964324'){
      book.price=book.price*0.8
      book.title='discount applied'
    }
   }  
})


  // this.before (['CREATE', 'UPDATE'], Authors, async (req) => {
  //   console.log('Before CREATE/UPDATE Authors', req.data)
  // })
  // this.after ('READ', Authors, async (authors, req) => {
  //   console.log('After READ Authors', authors)
  // })
  // this.before (['CREATE', 'UPDATE'], GenresVH, async (req) => {
  //   console.log('Before CREATE/UPDATE GenresVH', req.data)
  // })
  // this.after ('READ', GenresVH, async (genresVH, req) => {
  //   console.log('After READ GenresVH', genresVH)
  // })
  // this.before (['CREATE', 'UPDATE'], BookStatus, async (req) => {
  //   console.log('Before CREATE/UPDATE BookStatus', req.data)
  // })
  // this.after ('READ', BookStatus, async (bookStatus, req) => {
  //   console.log('After READ BookStatus', bookStatus)
  // })
  // this.before (['CREATE', 'UPDATE'], Chapters, async (req) => {
  //   console.log('Before CREATE/UPDATE Chapters', req.data)
  // })
  // this.after ('READ', Chapters, async (chapters, req) => {
  //   console.log('After READ Chapters', chapters)
  // })


  return super.init()
}}
