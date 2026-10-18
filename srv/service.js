const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService { init() {

  //const { Books, Authors, GenresVH, BookStatus, Chapters } = cds.entities('BookstoreService')
  const { Books } = cds.entities('BookstoreService')


  //this.before (['CREATE', 'UPDATE','READ'], Books, async (req) => {
  
  this.on('addDiscount',async()=>{
  //  await UPDATE(Books).set({price:{'*=':0.9}});
  //await UPDATE(Books).set({price:{func:ROUND,args:[{xpr:[{ref:['price'],'*',{val:0.9}}]}]}});
//await UPDATE(Books).set({price:{func:'ROUND',args:[{xpr:[{ref:['price']},'*',{ val: 0.9 }]}]}});
await UPDATE(Books).set({price:{func:'ROUND',args:[{xpr:[{ref:['price']},'*',{ val: 0.9 }]},{ val: 2 }]}});
})
    this.on('addStock',Books,async(req)=> {
    //console.log('AddStock called')
    //console.log(req.params)
    const bookId=req.params[0].ID
    //console.log(bookId);
    await UPDATE(Books)
    .set({stock:{'+=':1}})
    .where({ID:bookId})
  });

   this.on('changePublishDate',Books,async(req)=> {
    const bookId=req.params[0].ID
    const newDate=req.data.newDate
    //console.log(req.data);
    await UPDATE(Books)
    .set({publishedAt:newDate})
    .where({ID:bookId})
  });  

  this.on('changeStatus',Books,async(req)=> {
    const bookId=req.params[0].ID
    const newStatus=req.data.newStatus
    //console.log(req.data);
    await UPDATE(Books)
    .set({status_code:newStatus})
    .where({ID:bookId})
  });

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
