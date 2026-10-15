//Before the action happens
this.before('READ',Books,async (req) =>{});
//During action handling
this.on('READ',Books,async(req, next)=> {
    return next()
});
//After the action happens
this.onafter('READ',Books,async(books,req)=>{});